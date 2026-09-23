# Agent instructions

Working rules for the Homebrew tap that installs `lore`.

## Delivery

Trunk-based. Signed commits straight to `trunk`, then push. No branch, no pull
request. The default branch is `trunk` because the delivery model is.

Almost every commit here is a formula bump pushed on release, using a token
scoped to this repository alone. A pull request per bump would need a human
merge on every release, which is exactly what the automation exists to avoid.
Human edits are rare and small, and a formula is trivially reverted, so CI on
push covers the review gap.

## What lives here

One formula per project, in `Formula/`. Today that is `Formula/lore.rb`,
installing the release archives published by `attila/lore` and verified against
that release's `SHA256SUMS`. Each formula is named after its project.

Lore's archives carry the version in their names, so Homebrew reads the version
from the URLs and the formula does not state it. A bump therefore rewrites two
things together: every URL and every checksum.

## Before every push

1. Run `brew style` and `brew audit --strict` against the formula.
2. Install and test it from a local tap, on the platform you are on.
3. Show the change and the command output, then wait for a go.

CI repeats all of it on push, on macOS and on Linux, for every formula.
