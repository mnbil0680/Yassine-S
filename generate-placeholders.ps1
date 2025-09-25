# Generate placeholder images to replace LFS pointer files
# This allows Astro to build successfully while real assets are being restored

Add-Type -AssemblyName System.Drawing

function New-PlaceholderImage {
    param(
        [string]$FilePath,
        [int]$Width = 800,
        [int]$Height = 600,
        [string]$BackgroundColor = "LightGray",
        [string]$TextColor = "DarkGray"
    )
    
    $filename = [System.IO.Path]::GetFileNameWithoutExtension($FilePath)
    $extension = [System.IO.Path]::GetExtension($FilePath).ToLower()
    
    # Create bitmap
    $bitmap = New-Object System.Drawing.Bitmap($Width, $Height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    
    # Fill background
    $bgBrush = [System.Drawing.Brushes]::$BackgroundColor
    $graphics.FillRectangle($bgBrush, 0, 0, $Width, $Height)
    
    # Add text
    $font = New-Object System.Drawing.Font("Arial", 24, [System.Drawing.FontStyle]::Bold)
    $textBrush = [System.Drawing.Brushes]::$TextColor
    $text = "PLACEHOLDER`n$filename"
    $textSize = $graphics.MeasureString($text, $font)
    $x = ($Width - $textSize.Width) / 2
    $y = ($Height - $textSize.Height) / 2
    $graphics.DrawString($text, $font, $textBrush, $x, $y)
    
    # Save based on extension
    try {
        switch ($extension) {
            '.png' { $bitmap.Save($FilePath, [System.Drawing.Imaging.ImageFormat]::Png) }
            '.jpg' { $bitmap.Save($FilePath, [System.Drawing.Imaging.ImageFormat]::Jpeg) }
            '.jpeg' { $bitmap.Save($FilePath, [System.Drawing.Imaging.ImageFormat]::Jpeg) }
            '.gif' { $bitmap.Save($FilePath, [System.Drawing.Imaging.ImageFormat]::Gif) }
            '.ico' { 
                # For ICO, create a smaller image
                $icoBitmap = New-Object System.Drawing.Bitmap(32, 32)
                $icoGraphics = [System.Drawing.Graphics]::FromImage($icoBitmap)
                $icoGraphics.FillRectangle($bgBrush, 0, 0, 32, 32)
                $icoBitmap.Save($FilePath, [System.Drawing.Imaging.ImageFormat]::Icon)
                $icoGraphics.Dispose()
                $icoBitmap.Dispose()
                return
            }
            default { $bitmap.Save($FilePath, [System.Drawing.Imaging.ImageFormat]::Png) }
        }
        Write-Host "Generated: $FilePath ($Width x $Height)" -ForegroundColor Green
    } catch {
        Write-Warning "Failed to generate $FilePath : $_"
    } finally {
        $graphics.Dispose()
        $bitmap.Dispose()
    }
}

# Find all LFS pointer files
$pointerFiles = @()
$extensions = '.png','.jpg','.jpeg','.ico','.gif'
foreach ($root in @('src/images','public/images')) {
    if (Test-Path $root) {
        Get-ChildItem -Recurse -File $root | Where-Object { 
            $extensions -contains $_.Extension.ToLower() -and $_.Length -lt 300 
        } | ForEach-Object {
            try {
                $first = Get-Content -Path $_.FullName -TotalCount 1 -ErrorAction Stop
                if ($first -eq 'version https://git-lfs.github.com/spec/v1') {
                    $pointerFiles += $_
                }
            } catch { }
        }
    }
}

Write-Host "Found $($pointerFiles.Count) LFS pointer image files to replace" -ForegroundColor Yellow

# Generate placeholders for each pointer file
foreach ($file in $pointerFiles) {
    $width = 800
    $height = 600
    
    # Adjust size based on filename hints
    if ($file.Name -match 'favicon') { $width = 32; $height = 32 }
    elseif ($file.Name -match 'og|social') { $width = 1200; $height = 630 }
    elseif ($file.Name -match '1440') { $width = 1440; $height = 800 }
    elseif ($file.Name -match '800') { $width = 800; $height = 600 }
    elseif ($file.Name -match 'background|bg') { $width = 1440; $height = 900 }
    
    New-PlaceholderImage -FilePath $file.FullName -Width $width -Height $height
}

Write-Host "`nPlaceholder generation complete! You can now run 'pnpm run build' or 'pnpm run dev'" -ForegroundColor Green
Write-Host "Remember to replace these with real assets later." -ForegroundColor Yellow