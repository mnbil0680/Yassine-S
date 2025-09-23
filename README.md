# Yassine Soufa - Portfolio# Yassine Soufa - Portfolio



## Description## Description



This is the portfolio website for Yassine Soufa, showcasing expertise in photography, videography, and graphic design.This is the portfolio website for Yassine Soufa, showcasing expertise in photography, videography, and graphic design.

 

## About## About



This portfolio showcases my work as a creative professional specializing in:This portfolio showcases my work as a creative professional specializing in:



- Photography & Visual Storytelling- Photography & Visual Storytelling

- Video Production & Editing- Video Production & Editing

- Graphic Design & Brand Identity- Graphic Design & Brand Identity

- Digital Content Creation- Digital Content Creation



## Development## Development



The site is built with [Astro](https://astro.build/) and configured for GitHub Pages deployment.The site is built with [Astro](https://astro.build/) and configured for GitHub Pages deployment.



Commands in [package.json](./package.json) can be run from a terminal at the root of the project:Commands in [package.json](./package.json) can be run from a terminal at the root of the project:



| Command                        | Action                                                                              || Command                        | Action                                                                              |

| :----------------------------- | :---------------------------------------------------------------------------------- || :----------------------------- | :---------------------------------------------------------------------------------- |

| `pnpm install`                 | Install dependencies                                                                || `pnpm install`                 | Install dependencies                                                                |

| `pnpm run dev`                 | Start local dev server at `localhost:4321`                                         || `pnpm run dev`                 | Start local dev server at `localhost:4321`                                         |

| `pnpm run build`               | Build production site to `./dist/`                                                  || `pnpm run build`               | Build production site to `./dist/`                                                  |

| `pnpm run preview`             | Preview build locally before deploying                                              || `pnpm run preview`             | Preview build locally before deploying                                              |

| `pnpm run astro ...`           | Run CLI commands like `astro add`, `astro check`                                    || `pnpm run astro ...`           | Run CLI commands like `astro add`, `astro check`                                    |

| `pnpm run astro -- --help`     | Get help using the Astro CLI                                                        || `pnpm run astro -- --help`     | Get help using the Astro CLI                                                        |



## Deployment## Deployment



This site is configured for GitHub Pages deployment with automatic builds:This site is configured for GitHub Pages deployment with automatic builds:



1. Push changes to the `master` branch1. Push changes to the `master` branch

2. GitHub Actions will automatically build and deploy the site2. GitHub Actions will automatically build and deploy the site

3. The site will be available at: `https://mnbil0680.github.io/Yassine-Soufa`3. The site will be available at: `https://mnbil0680.github.io/Yassine-Soufa`

| `pnpm -s dlx @astrojs/upgrade` | [Update Astro](https://docs.astro.build/en/upgrade-astro/) and related dependencies |

## License

Media assets and other large files are stored with [Git LFS](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github).

This portfolio and its content are the property of Yassine Soufa. All rights reserved.
## Deployment

- The site is deployed with GitHub Pages to [br3ndonland.github.io](https://br3ndonland.github.io/) using a [GitHub Actions workflow](.github/workflows/ci.yml). The `astro build` step includes `--site "https://${GITHUB_REPOSITORY##*/}"` so that [the site URL can be set for GitHub Pages](https://docs.astro.build/en/guides/deploy/github/) without having to hard-code it in the [Astro config file](https://docs.astro.build/en/guides/configuring-astro/).
- The site is also deployed with [Vercel](https://vercel.com/docs/frameworks/astro) to other domains including [bws.bio](https://www.bws.bio).

## License

Content in this repository authored by Brendon Smith is [licensed](LICENSE) under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/). _Why?_

- The repository is mostly prose and personal content. CC BY-SA allows the author to retain copyright and encourages attribution of creative content. [Wikipedia uses this license](https://foundation.wikimedia.org/wiki/Policy:Terms_of_Use).
- The software code in this repository is not intended for reuse, so the `package.json` lists the source code as `UNLICENSED`. However, if the need to adapt the source code ever arises, [CC BY-SA 4.0 is one-way compatible with GPLv3](https://wiki.creativecommons.org/wiki/ShareAlike_compatibility:_GPLv3) (CC BY-SA 4.0 -> GPLv3), allowing source code to be relicensed under GPLv3 if necessary. See the Creative Commons [compatible licenses page](https://creativecommons.org/share-your-work/licensing-considerations/compatible-licenses/) for further details. It should also be noted that, although [CC BY-SA licenses are not generally recommended for software](https://creativecommons.org/faq/), [CC BY-SA 4.0 is listed on the Software Package Data Exchange ](https://spdx.org/licenses/CC-BY-SA-4.0.html) (SPDX) with identifier `CC-BY-SA-4.0`, and [SPDX-listed licenses can be used with npm](https://docs.npmjs.com/cli/v10/configuring-npm/package-json) in `package.json`.
