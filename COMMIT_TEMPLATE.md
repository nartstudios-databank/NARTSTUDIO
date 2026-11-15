# Commit Message Template

## Format

```
TRELLO_CARD_ID: <card-number>
STAGE: <2-letter-code>
PAGE: <v##>
FILE: <brief-description-no-spaces>
```

## Examples

```
TRELLO_CARD_ID: COMIC-042
STAGE: LI
PAGE: v03
FILE: hero_intro_clip01
```

```
TRELLO_CARD_ID: ANIM-017
STAGE: LA
PAGE: v01
FILE: shot02_layout
```

## Fields

| Field | Description | Example |
|-------|-------------|---------|
| `TRELLO_CARD_ID` | The Trello card this commit relates to. The Power-Up reads this to auto-move cards. If the Power-Up fails, manual card-move rules use this text. | `COMIC-042`, `ANIM-017` |
| `STAGE` | 2-letter pipeline stage code. Must be one of: SC, ST, LA, LI, FL, RE, LF, QA | `LI` (Line Art), `FL` (Flats) |
| `PAGE` | Page number with `v` prefix, or `v01` for single-page projects | `v05`, `v01` |
| `FILE` | Brief filename description — no spaces, use underscores | `hero_intro_clip01` |

## Why this format

- **TRELLO_CARD_ID** works with the Trello GitHub Power-Up trigger (commit text) and is the guaranteed fallback for manual card moves.
- **STAGE** and **PAGE** let anyone quickly understand the file's place in the pipeline at a glance.
- **FILE** is a human-readable identifier that matches the naming convention's `FILE` token.