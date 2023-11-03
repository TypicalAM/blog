---
title: "mDawka - e-recepta pill scheduler"
summary: "A smart and easy pill scheduler"
tags: ["golang","echo","react","hackathon"]
date: 2023-11-01
draft: false
---

[mDawka](https://github.com/TypicalAM/mDawka) is a pill scheduler based on your `e-recepta` (the polish automatic `e-prescription` system). It is a winning project in the **Health & Wellbeing** category at [Hackyeah 2023](https://hackyeah.pl). Just scan your `e-recepta` and select the hours at which you want to take your meds and we give you a **calendar synchronisation file** which can be imported into **Google Calendar, Outlook and many more**!

## Features

- Takes a `PESEL` and special code combo or
- Takes a photo scan of the receipt
- Provides the user with a screen to select the times at which to take pills
- Auto-generated reminder event schedule
- No personal data stored (only a one-time transaction token which cannot be tied to the person)

## Why make it?

- From 2020 every perscription in Poland is a `e-recepta`
- Every similar app has tons of adds (interference with the users calendar ecosystem)
- Easier to answer the question *Did I take the pill today?*

## Showoff

{{< youtube NWWA5lCHS-A >}}

## Where can I find it?

**The project is currently live at [mdawka.piaseczny.dev](https://mdawka.piaseczny.dev)**! If you want, you can check it out on [GitHub](https://github.com/TypicalAM/mDawka).
