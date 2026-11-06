# Video prompt workflows

Read the section for the current task. Keep the final prompt focused on visible, audible, model-actionable information.

## New idea

If the idea is underspecified, ask about the highest-impact unknown first: target model, duration, one-shot versus cuts, or the main action. Avoid a long questionnaire. Offer a small set of useful options plus free choice. Treat "you decide" as permission to decide the named item; it does not answer unrelated questions.

After the core idea is clear, draft directly. If the user wants a quick result, fill low-impact gaps with sensible assumptions and state them briefly outside the prompt.

## One continuous shot

Describe one camera setup and a continuous action. Structure time as phases if helpful: opening state, action/build, and ending state. Explain how the subject and environment move in relation to the camera. Do not use transitions, cuts, or montage language unless the user requests them.

## Multiple shots or clips

For each shot, state its purpose, subject, location, framing, camera motion, action, and transition or continuity link. Keep a short overall brief for shared style and story context, then make every separately generated clip prompt self-contained. Distinguish a cut to a new shot from a continuation of the same camera take. Confirm the target interface's clip limits when they matter; otherwise mark duration assumptions for later checking.

## Image or video reference

Use available visual inspection tools to review the actual reference. Record only details relevant to the user's stated goal. Separate:

- **Observed:** directly visible or audible properties.
- **Inferred:** a plausible reading that is not certain.
- **Designed:** new material added to satisfy the request.

Ask which properties should carry over when that is unclear: subject identity, wardrobe or object design, location, palette, lighting, camera, motion, or sound. Do not silently treat a reference as a literal first or last frame. If the media cannot be inspected, say so and ask for a description or an accessible upload.

For a reference-video recreation, describe the sequence of visible events and camera changes. Do not claim to know the original prompt, lens, exact camera settings, or off-screen events.

## Improve an existing generation

Ask what differs from the intended result if the user has not said. Translate feedback into visible changes, then revise only the relevant prompt parts. For example, replace vague instructions such as "more dynamic" with a camera path, speed, subject relationship, and start/end position. Avoid stacking contradictory constraints or adding large negative lists without a specific failure to prevent.

## Output pattern

Use a compact structure like this when the platform has no verified required syntax:

```text
Priority: [the result that matters most; conditions that must remain true]
Scene: [subject, setting, visual premise]
Action: [observable progression from opening to ending state]
Camera: [framing, angle, movement, focus behavior]
Look: [light, color, texture, atmosphere]
Sound: [dialogue, ambience, effects, or silence, as requested]
Constraints: [relevant inclusions, exclusions, duration, aspect ratio]
```

Do not force every heading when it adds no value. Put the finished prompt in one copyable block. Keep assumptions, caveats, and optional alternatives outside it.
