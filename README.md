# Muse Video Prompt Skill

A reusable Agent Skill for turning video ideas, references, draft prompts, and generation feedback into clear video-generation prompts. The instructions are written for broad compatibility with Muse and other video tools; verify each product's current features before using model-specific controls.

## Included files

- `SKILL.md` — entrypoint and shared directing workflow
- `references/workflows.md` — guidance for single shots, multi-shot work, references, and prompt revision
- `agents/openai.yaml` — Codex interface metadata

## Download

Open the repository's **Code → Download ZIP** menu, or clone it:

```bash
git clone https://github.com/ziyan-ai/ZIYANmuse.git
```

## Install and invoke in Codex

Place the repository contents in a skill folder under your Codex skills directory:

```text
%USERPROFILE%\.codex\skills\muse-video-prompt\
```

For example, after cloning, copy the repository folder to that path. Then invoke it in a chat with:

```text
$muse-video-prompt
```

## License

This is a community skill and is not affiliated with Muse or Meta. Review the wording and test it with your target agent before relying on it.
