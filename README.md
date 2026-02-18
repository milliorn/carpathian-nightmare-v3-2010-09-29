# Carpathian Nightmare (NWN1) — Archival Nasher Unpack

This repository is an archival, source-unpacked version of the *Carpathian Nightmare* Neverwinter Nights (NWN1 / NWN:EE) module.

This repository exists for:

- historical preservation
- structured storage of unpacked content

No source files in this repository are modified for compatibility, formatting, linting, compiler compliance, modernization, or normalization.
The contents reflect the original module state exactly as last compiled in the NWN Toolset (circa 2010, Windows environment).

---

## Repository Intent

Some scripts in this module:

- were last compiled in the NWN Toolset (Windows XP/7 era)
- may not compile cleanly under modern CLI compilers
- may contain legacy CRLF line endings
- may contain historical escape patterns that modern compilers reject

These are preserved exactly as originally authored.

This repository explicitly does NOT:

- normalize line endings
- fix string literals
- escape legacy characters
- refactor code
- enforce formatting
- recompile `.nss` into `.ncs`
- correct compiler warnings or errors
- modernize includes
- patch compatibility issues

If `nasher pack` reports script compilation errors under a modern CLI environment, that behavior is expected and does not represent corruption of the archive.

This repository prioritizes:

- historical accuracy
- reproducibility of the unpacked state
- structural clarity
- minimal transformation

It does not prioritize:

- modern compiler compliance
- refactoring
- formatting cleanup
- cross-platform normalization
- runtime modernization

---

## Requirements

- Neverwinter Nights (NWN1 / NWN:EE)
- Nasher installed and available on your PATH

---

## Workflow (fish shell)

This repository does NOT include the original `.mod` file.

To generate a module file from this archive:

```fish
nasher pack default
```
or

```fish
nasher pack default --yes
```

Notes:

- The produced `.mod` will be created from the `src/` contents and `nasher.cfg`.
- Packing may fail or report script compilation errors in modern CLI environments due to preserved legacy source (see policy above).
- This archive is intended for inspection and preservation first; successful repacks are not guaranteed.

---

## Repository Layout

```
.
├── nasher.cfg
├── .gitignore
└── src/
    ├── areas/
    ├── blueprints/
    │   ├── palettes/
    │   ├── encounters/
    │   └── stores/
    ├── dialog/
    ├── journal/
    ├── module/
    ├── scripts/
    ├── 2da/
    ├── textures/
    ├── portraits/
    ├── models/
    ├── tilesets/
    ├── audio/
    ├── music/
    ├── ui/
    ├── fonts/
    ├── containers/
    ├── config/
    ├── text/
    └── unknown/
```

## Attribution / License

This repository represents an unpacked archival view of a NWN1 module.
All contents of this repository must retain proper attribution.

If any portion of this repository including scripts, resources, structure, or derivative adaptations is used, redistributed, modified, or incorporated into another project, visible credit must be given to the original repository and its author.

Removal of attribution, misrepresentation of authorship, or presentation of this work as wholly original is not permitted.

Any use of these materials must also comply with the Neverwinter Nights EULA and applicable copyright law.

No warranty is provided. This archive is distributed as-is, without liability.