# WandererCover V4-EC 190 mm Scope Ring Mount (OpenSCAD)

A parametric, 3D-printable two-piece dew shield ring that mounts a WandererCover V4-EC 190 mm flat panel without zip ties. The panel bracket's feet are held by two sliding L-clamps whose tongues engage the bracket's foot slots. One file covers several scopes, and the panel sits centered on each.

> Unofficial design. Not affiliated with or endorsed by WandererAstro.

Design, measurements and testing by John. OpenSCAD code written with assistance from Claude (Anthropic).

## Compatibility

- **Tested only with the WandererCover V4-EC 190 mm.** It has not been tested with any other WandererCover size or model, or with any other flat panel.
- For any other panel or size, measure everything listed in **What to measure** below and enter it before printing.

## Supported scopes (dew shield OD)

| Scope | OD (mm) | Top ring label |
|---|---|---|
| William Optics RedCat 61 WIFD | 92.0 | RC61 R+28.2 (riser) |
| Stellarvue SVX90T | 121.2 | SVX90 R+13.7 (riser) |
| William Optics Ultra-Cat 108 WIFD | 156.0 | UC108 S-3.8 (saddle) |
| Astro-Tech AT130EDT | 169.0 | AT130 S-10.2 (saddle) |

Measure your own dew shield before printing. Other diameters work by setting `telescope_select`. Small shields get a riser and large shields get a cut-down saddle, so the bracket feet always sit 95 mm (`panel_axis_offset`) above the optical axis.

## What to measure

All values are in mm, measured with calipers. The defaults are the measured values for the WandererCover V4-EC 190 mm.

### Flat panel (section: Panel Geometry)

Bracket foot, seen from the side (there are two feet, one on each side of the bracket):

```
        motor housing
   +------------------------+  ---
   |                        |   |  top section (4.6 on the 190)
   |   +----------------+   |   |
   |   |      slot      |   |   |  foot_slot_h
   |   +----------------+   |   |
   |                        |   |  foot_slot_z
   +------------------------+  ---  bottom of foot (rests on the ring)
   |<-------foot_length----->|
       |<--foot_slot_len->|
```

| Parameter | What to measure | 190 mm value |
|---|---|---|
| `panel_axis_offset` | Cover closed: bottom of the feet to the **center** of the panel | 95.0 |
| `felt_thickness` | Felt pad on the bottom of the feet (0 if none) | 0.6 |
| `foot_outer_span` | Outside of one foot to outside of the other, across the bracket | 52.5 |
| `foot_thickness` | Thickness of one foot (the slot runs through this) | 9.47 |
| `foot_length` | Length of a foot, along the telescope tube | 31.6 |
| `foot_slot_z` | Bottom of the foot (no felt) to the bottom of the slot | 4.1 |
| `foot_slot_h` | Slot height | 3.11 |
| `foot_slot_len` | Slot length | 26.1 |
| `foot_height` | Total foot height | 11.81 |

Then set the clamp to fit the foot (section: L-Clamp):

| Parameter | Rule | 190 mm value |
|---|---|---|
| `clamp_len` | Same as `foot_length` | 31.6 |
| `tongue_width` | Less than `foot_slot_len` | 24.1 |
| `tongue_thickness` | Less than `foot_slot_h`; tune with a test print | 2.85 |
| `tongue_length` | Less than `foot_thickness` and less than `clamp_travel` | 7.01 |

### Dew shield (section: Telescope Profile Selector)

- Outside diameter where the ring sits. See **Adding a telescope** below.

### Hardware (sections: Clamp Screw and Bottom Ring)

- Your nuts: `nut_af` / `nut_thick` (M2.5) and `bot_nut_af` / `bot_nut_thick` (M5). Measure the width across flats and the thickness.

### Cables (section: Cable Trough)

- Width and height of the panel's cable bundle. Set `trough_width` to the width + 0.5 and `trough_inner_h` to the height + 0.5.

### Placement (not a parameter)

- Where the feet sit along the dew shield when the cover is closed. On the 190 mm panel, the feet start 7 mm behind the front end of the dew shield. Position the ring there.

## Adding a telescope

### 1. Measure the dew shield

- Use calipers on the dew shield's **outside diameter**, at the spot where the ring will sit: about 7 to 39 mm behind the front end of the shield (that's where the bracket feet sit).
- Measure twice, 90 degrees apart, and average the two. Write the result in mm to one decimal place, for example `142.4`.
- Measure the bare shield, without felt. The 1 mm felt is already allowed for (`lining_clearance`).
- **Limit:** with the panel centered (`panel_axis_offset = 95`), the dew shield OD must be **under about 176 mm**. Above that, less than 6 mm of plastic is left under the bracket, and the console prints a warning.

### 2. Add it to the scope dropdown

Open the `.scad` file in a text editor and find this line near the top:

```
telescope_select = 156.0; // [92.0: William Optics RedCat 61 WIFD, 121.2: Stellarvue SVX90T, 156.0: William Optics Ultra-Cat 108 WIFD, 169.0: Astro-Tech AT130EDT]
```

Add your scope inside the square brackets as `diameter: name`, separated by a comma:

```
telescope_select = 156.0; // [92.0: William Optics RedCat 61 WIFD, 121.2: Stellarvue SVX90T, 142.4: My Scope 102, 156.0: William Optics Ultra-Cat 108 WIFD, 169.0: Astro-Tech AT130EDT]
```

- Each diameter must be different from the others.
- Keep the `.0` or decimal exactly as you will type it in step 3.

### 3. Add its short label (engraved on the ring)

Find this block:

```
scope_code =
    dew_shield_od == 92.0  ? "RC61" :
    dew_shield_od == 121.2 ? "SVX90" :
    dew_shield_od == 156.0 ? "UC108" :
    dew_shield_od == 169.0 ? "AT130" : str("OD", dew_shield_od);
```

Add one line for your scope **above the last line**, using the same diameter as step 2 and a short code of 6 characters or fewer:

```
scope_code =
    dew_shield_od == 92.0  ? "RC61" :
    dew_shield_od == 121.2 ? "SVX90" :
    dew_shield_od == 142.4 ? "MY102" :
    dew_shield_od == 156.0 ? "UC108" :
    dew_shield_od == 169.0 ? "AT130" : str("OD", dew_shield_od);
```

If you skip this step, the ring still works and is engraved with `OD142.4` instead.

### 4. Check before printing

1. Save, reopen the file in OpenSCAD, and select your scope in the Customizer dropdown.
2. Preview `assembly` (F5) and read the console:
   - `TOP LABEL` shows your code, plus `R+` (riser) or `S-` (saddle) and the amount.
   - There should be no `WARNING` lines.
3. Print `ring_top` and test-fit it on the dew shield before printing the bottom half.

## Parts (`part` dropdown in the Customizer)

| Part | Print orientation |
|---|---|
| `ring_top` | Seam face down, normal supports (build plate only) under the bore |
| `ring_bottom` | Seam face down, normal supports (build plate only) under the bore |
| `clamp` | Left + right pair, printed on their sides; the left clamp has the cable trough by default |
| `test_clamp_nut` | Slice of the top ring at the clamp nut slot; uses the Clamp Screw settings |
| `test_bot_nut` | Slice of the bottom ring at the M5 nut slot; uses the Bottom Ring settings |
| `assembly` | Preview only |

## Hardware

- 2 x M2.5 x 12 socket head cap screws + 2 x M2.5 hex nuts (clamps to top ring)
- 2 x M5 x 20 socket head cap screws + 2 x M5 hex nuts (ring halves)
- Bore lining: 1 mm self-adhesive felt, 1 in wide (bore has 1 mm radial clearance)

Screw length limits are printed to the OpenSCAD console.

## Tuning the fit

1. Measure your nuts and enter them as `nut_af` / `nut_thick` (M2.5) and `bot_nut_af` / `bot_nut_thick` (M5).
2. Print `test_clamp_nut` and `test_bot_nut`. Each block is engraved with the tolerance it was printed with.
3. Adjust `nut_tol` / `bot_nut_tol` until the nut slides in by hand and doesn't spin. Then print the ring.
4. Tongue fit in the bracket foot slot (3.11 mm): `tongue_thickness` (2.85 tested in PLA) and `tongue_width` (24.1 tested).

Re-test the fits if you change filament.

## Assembly

1. Line both ring halves with felt.
2. Slide the M5 nuts into the bottom ring from the back face, and the M2.5 nuts into the top ring from the back face.
3. Fit the ring to the dew shield about 7 mm behind its front end, leaving a visible gap at both seams when tightened.
4. Set the panel bracket on the platform. Route the cables under the trough on the left clamp, slide both clamp tongues into the foot slots, press down, and tighten.
5. Check the panel's open and closed angles in the WandererCover software, and check that the arms clear everything.

## Requirements

OpenSCAD with the Customizer. The label font is Liberation Sans Bold.

## License

[CC BY-NC-SA 4.0](LICENSE.md): share and adapt with credit, no commercial use, and adaptations keep the same license.
