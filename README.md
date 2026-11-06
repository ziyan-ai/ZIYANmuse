# Muse Video Prompt Skill

A reusable Agent Skill for turning video ideas, references, draft prompts, and generation feedback into clear video-generation prompts. The instructions are written for broad compatibility with Muse and other video tools; verify each product's current features before using model-specific controls.

## Included files

- `SKILL.md` — entrypoint and shared directing workflow
- `references/workflows.md` — guidance for single shots, multi-shot work, references, and prompt revision
- `agents/openai.yaml` — Codex interface metadata

## Install in Codex

Copy this folder into your Codex skills directory, for example:

```text
%USERPROFILE%\.codex\skills\muse-video-prompt\
```

Then invoke it in a chat with:

```text
$muse-video-prompt
```

## License

Choose and add a license before publishing. Do not imply affiliation with Muse, Meta, or the repository that prompted this project. Review the wording and test it with your target agent before publishing.
