---
title: "goread - News in the Terminal"
summary: "Read your RSS and ATOM news straight on the cmdline, no hassle"
tags: ["golang","terminal","bubbletea"]
date: 2023-11-01
draft: false
---

[goread](https://github.com/TypicalAM/goread) is a terminal user interface (TUI) news reader on the commandline! Constantly keeping track of things like Twitter and Reddit can be very cumbersome, so **I wanted a distraction-free source of information.** Most news websites still support using [RSS/ATOM](https://docs.kde.org/stable5/en/akregator/akregator/rss-and-atom-feeds.html) to view their articles so **why not *go* there (pun intended) and build a client for it!**

## Features

- A nice and simple TUI
- Categorizing feeds
- Downloading articles for later reading
- Cool and customizable colorschemes
- OPML import/export support

## Why even make it?

I wanted to have something on the commandline, because if this would be in the browser, why not just open up reddit then? The temptation would be too great (I also wanted to learn [bubbletea](https://github.com/charmbracelet/bubbletea)). My original idea included being able to view content inside a company network - `ssh` into company machine and view their feed on the remote, but that really died down in the process *(and also slack has their own RSS/ATOM viewer which kind of defeats the purpose)*.

Things like [newsboat](https://newsboat.org/index.html) exist, but they seem too complex for a new user, they also look really bad in my opinion and that's fine, they are made for the poweruser with macros after all. I made something simple to use and also nice looking **so it is adaptable to any colorscheme and setup.**

## Showoff

### Basic usage

![Adding a category and a feed](add_category_feed.gif)

### Link lighlighting

![Link highlighting](link_highlight.gif)

### Colorscheme generation

![Importing a colorscheme](colorscheme_import.gif)

## Where can I find it?

You can install `goread` using the `Arch User Repository (AUR)`, `homebrew` or with `go install`. **Just check out the installation options [here](https://github.com/TypicalAM/goread)!**
