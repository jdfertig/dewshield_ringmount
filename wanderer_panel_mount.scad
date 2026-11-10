// Copyright (c) 2026 John. Licensed under CC BY-NC-SA 4.0
// https://creativecommons.org/licenses/by-nc-sa/4.0/
// Unofficial design; not affiliated with or endorsed by WandererAstro.
// =========================================================================
// WANDERERCOVER V4-EC 190 MOUNT - SCOPE RING (TOP/BOTTOM) + L-CLAMPS
// Rev E (2026-10-27)
//  - Split into ring_top (riser/saddle + clamp nut traps + label) and
//    ring_bottom (plain half ring + label).
//  - Clamp screws go into captive M2.5 hex nuts that slide in from the ring's
//    back face; the screw pulls the nut against solid plastic. No supports
//    expected: the nut tunnel roof is a ~5.3 mm bridge.
//  - Top ring is engraved with scope code and riser/saddle amount.
// Rev F (2026-11-10): bottom ring gets captive M5 hex nut slots for the ring
//    clamping screws (replaces the open nut pocket). Toggle: bot_nut_trap.
//    Screw hole is blind (bot_screw_tip_clear past the nut), not visible outside.
// Rev G (2026-11-10): nut-slot test blocks (part = test_clamp_nut / test_bot_nut).
//    Each block is a slice cut from the REAL ring at the nut slot and uses the
//    SAME parameters as the ring: Clamp Screw section for test_clamp_nut,
//    Bottom Ring section for test_bot_nut. No separate test settings.
//    Block is engraved with the nut_tol / bot_nut_tol it was printed with.
// Rev H (2026-11-10): cable trough on the clamp back end (away from panel):
//    open-bottom U channel, cable laid under it runs across the clamp.
//    Trough on the LEFT clamp (looking from camera toward objective) by default.
//    Clamps are a left/right pair; part = clamp prints both.
// UNTESTED: not rendered by the author. Preview (F5) and render (F6) first.
// =========================================================================

/* [Part to Render] */
part = "assembly"; // [assembly: Both ring halves + clamps + ghost feet, ring_top: Top half (print seam down), ring_bottom: Bottom half (print seam down), clamp: Clamp pair - left + right (print on side), test_clamp_nut: Test block - clamp nut slot (uses Clamp Screw settings), test_bot_nut: Test block - bottom ring nut slot (uses Bottom Ring settings)]

/* [Telescope Profile Selector] */
telescope_select = 156.0; // [92.0: William Optics RedCat 61 WIFD, 121.2: Stellarvue SVX90T, 156.0: William Optics Ultra-Cat 108 WIFD, 169.0: Astro-Tech AT130EDT]

/* [Ring Sizing Parameters] */
ring_wall_thickness = 18.0; // Wall at the seam; top-half top is set by panel_axis_offset
ring_width = 32.0;          // Along the tube axis; >= foot/clamp length 31.6
clamping_gap = 3.5;         // Total gap between ring halves when closed on the tube
lining_clearance = 1.0;     // Felt/rubber lining in the bore

/* [Ring Clamping Hardware] */
clamp_screw_dia = 5.3;      // M5 clearance
counterbore_dia = 12.5;
pocket_y_width = 12.5;      // Keep equal to counterbore_dia
shelf_height = 5.0;

/* [Edge Finishing] */
edge_chamfer = 1.5;         // Front/back face perimeter chamfer (0 = off)
bore_chamfer = 1.0;         // Bore lead-in chamfer (0 = off)

/* [Label] */
label_on = true;
label_size = 4.0;           // Cap height-ish, mm
label_depth = 0.6;          // Engrave depth into the front face

/* [Panel Geometry (measured)] */
panel_axis_offset = 95.0;   // Bottom of bracket feet (with felt) to panel center
felt_thickness = 0.6;       // Felt on foot bottoms
foot_outer_span = 52.5;     // Feet outside-to-outside
foot_thickness = 9.47;      // Each foot, across the tube
foot_length = 31.6;         // Each foot, along the tube
foot_slot_z = 4.1;          // Foot bottom (bare, no felt) to slot bottom
foot_slot_h = 3.11;
foot_slot_len = 26.1;
foot_height = 11.81;        // 4.1 + 3.11 + 4.6

/* [L-Clamp] */
clamp_len = 31.6;           // Along the tube (matches foot length)
clamp_depth = 14.0;         // Body depth outward from the foot face
clamp_height = 9.0;
clamp_top_radius = 2.0;     // Round on the top outer edge of the body
clamp_fit = 0.21;            // [0:0.05:1] Gap between clamp body and foot outer face when engaged
tongue_length = 7.01;        // Must be < clamp_travel so the tongue can fully retract
tongue_width = 24.1;        // < foot_slot_len (24.1)
tongue_thickness = 2.85;     // [2.0:0.01:3.11] Slot is 3.11 2.85 printed fits; test-print and adjust
tongue_preload = 0.3;       // [0:0.05:1] Tongue sits this far below the uncompressed slot bottom (compresses felt)
clamp_travel = 8.0;         // Slide travel of the screw slot

/* [Cable Trough (clamp back end, away from panel)] */
cable_trough = true;        // Open-bottom U channel on the clamp back face
trough_clamp = "left";      // [left: Left clamp only (camera end looking toward objective), right: Right clamp only, both: Both clamps]
trough_width = 6.0;         // Inside width (cable bundle 5.5)
trough_wall = 2.0;          // Outer side wall
trough_inner_h = 3.5;       // Inside height - set to cable bundle height + 0.5
trough_roof = 2.0;          // Roof thickness

/* [Clamp Screw: M2.5 SHCS into captive hex nut] */
screw_clear = 3.11;          // Slot width in the clamp
head_slot_w = 5.61;          // M2.5 SHCS head is 4.5
head_pocket = 3.21;          // 2.5 head height + 0.5
ring_screw_clear = 3.21;     // Clearance hole in the ring above/below the nut
nut_af = 5.61;               // M2.5 hex nut across flats - measure yours
nut_thick = 2.31;            // M2.5 hex nut thickness - measure yours
nut_tol = 0.31;              // Added to across-flats and thickness for the slide-in tunnel
nut_roof = 3.01;             // Plastic between platform top and nut top
screw_tip_clear = 4.01;      // Hole depth below the nut for the screw tip
nut_entry = "back";         // [back: Back face (away from panel), front: Front face (panel side)]

/* [Bottom Ring: M5 captive hex nut for ring clamping screws] */
bot_nut_trap = true;        // true = captive nut slot; false = original open pocket
bot_screw_clear = 5.3;      // M5 clearance hole through the bottom half
bot_nut_af = 8.0;           // M5 hex nut across flats - measure yours
bot_nut_thick = 4.0;        // M5 hex nut thickness - measure yours
bot_nut_tol = 0.31;         // Added to across-flats and thickness for the slide-in tunnel
bot_nut_roof = 3.01;        // Plastic between the seam face and the nut
bot_screw_tip_clear = 6.0;  // Blind-hole depth past the nut for the screw tip (hole does not exit the ring)
bot_nut_entry = "back";     // [back: Back face (away from panel), front: Front face (panel side)]

/* [Hidden] */
// Test-block slice margins (not ring settings; they only trim the slice)
test_wall = 4.0;            // Plastic kept on the bore side of the slot
test_cap = 3.0;             // Plastic kept beyond the screw-hole bottom
test_text_size = 2.0;
test_text_depth = 0.4;

// ---------------- Calculated ----------------
dew_shield_od = telescope_select;
inner_r = (dew_shield_od / 2) + lining_clearance;
outer_r = inner_r + ring_wall_thickness;

half_box_w = (outer_r * 2) + 20.0;
half_box_h = ring_width;
half_box_z = outer_r;
facet_leg = (outer_r * 0.78) / sqrt(2);

bore_z = -clamping_gap / 2;                  // Optical axis in part coordinates
platform_z = bore_z + panel_axis_offset;      // Top-half face that the feet sit on
needs_riser = platform_z > half_box_z;
riser_amount = platform_z - half_box_z;       // + = riser, - = saddle cut
top_z_top = max(platform_z, half_box_z);

bolt_offset_from_center = (half_box_w / 2) - 12.0;

foot_face_x = foot_outer_span / 2;
clamp_x0 = foot_face_x + clamp_fit;
nut_x = clamp_x0 + clamp_depth / 2 + clamp_travel / 2;  // Screw at outer slot end when engaged
riser_half_w = clamp_x0 + clamp_depth + 1.5;

tongue_z = foot_slot_z + felt_thickness - tongue_preload;
clamp_floor = clamp_height - head_pocket;

nut_top_z = platform_z - nut_roof;
nut_bot_z = nut_top_z - (nut_thick + nut_tol);
screw_len_min = clamp_floor + nut_roof + nut_thick + 0.5;

scope_code =
    dew_shield_od == 92.0  ? "RC61" :
    dew_shield_od == 121.2 ? "SVX90" :
    dew_shield_od == 156.0 ? "UC108" :
    dew_shield_od == 169.0 ? "AT130" : str("OD", dew_shield_od);

top_label = str(scope_code, needs_riser ? " R+" : " S-", round(abs(riser_amount) * 10) / 10);
bottom_label = str(scope_code, " BOT");

$fn = 120;

// ---------------- Checks (see console) ----------------
echo(str("TOP LABEL: ", top_label));
echo(str(needs_riser ? "RISER above plain ring top (mm): " : "SADDLE: ring top cut down by (mm): ", abs(riser_amount)));
echo(str("Wall under platform at center (mm): ", platform_z - (bore_z + inner_r)));
echo(str("Material below nut-hole bottom to bore at nut position (mm): ",
         (nut_bot_z - screw_tip_clear) - (bore_z + sqrt(inner_r * inner_r - nut_x * nut_x))));
echo(str("Clamp screw: M2.5 x ", ceil(screw_len_min), " minimum (max ", floor(clamp_floor + nut_roof + nut_thick + nut_tol + screw_tip_clear), ") SHCS"));
if (clamp_travel < tongue_length + 0.5)
    echo("WARNING: clamp_travel too short - tongue cannot fully retract from the foot slot");
if (tongue_z < foot_slot_z - 0.01)
    echo("WARNING: tongue sits below the bare slot bottom - will not enter without felt compression");
if (platform_z - (bore_z + inner_r) < 6)
    echo("WARNING: less than 6 mm of wall under the platform");
if (nut_x + nut_af > bolt_offset_from_center - counterbore_dia / 2)
    echo("WARNING: clamp nut trap collides with ring M5 pocket");
if (cable_trough && trough_inner_h + trough_roof > clamp_height)
    echo("WARNING: cable trough is taller than the clamp body");

// Bottom-ring M5 nut trap checks
bot_af = bot_nut_af + bot_nut_tol;
bot_th = bot_nut_thick + bot_nut_tol;
bot_wall_out = half_box_w / 2 - (bolt_offset_from_center + bot_af / 2);
bot_bore_x = sqrt(inner_r * inner_r - pow(bot_nut_roof + bot_th - bore_z, 2));
bot_wall_in = (bolt_offset_from_center - bot_af / 2) - bot_bore_x;
bot_ring_h_at_bolt = half_box_z - facet_leg + (half_box_w / 2 - bolt_offset_from_center);
if (bot_nut_trap) {
    echo(str("Bottom nut trap: wall outside nut (mm): ", bot_wall_out, "  wall to bore (mm): ", bot_wall_in));
    echo(str("Ring screw: M5 x ", ceil(shelf_height + clamping_gap + bot_nut_roof + bot_nut_thick + 1),
             " minimum, M5 x ", floor(shelf_height + clamping_gap + bot_nut_roof + bot_th + bot_screw_tip_clear),
             " maximum (blind hole, gap fully open)"));
    echo(str("Solid material below blind hole to outer surface (mm): ",
             bot_ring_h_at_bolt - (bot_nut_roof + bot_th + bot_screw_tip_clear)));
    if (bot_wall_out < 3) echo("WARNING: less than 3 mm of wall outside the bottom nut trap");
    if (bot_wall_in < 3) echo("WARNING: less than 3 mm of wall between bottom nut trap and bore");
}

// ---------------- 2D profiles ----------------
module half_hex_profile() {
    hw = half_box_w / 2;
    polygon([
        [-hw, 0], [hw, 0],
        [hw, half_box_z - facet_leg],
        [hw - facet_leg, half_box_z],
        [-(hw - facet_leg), half_box_z],
        [-hw, half_box_z - facet_leg]
    ]);
}

module ring_profile_clipped() {
    intersection() {
        half_hex_profile();
        translate([-half_box_w, -1]) square([2 * half_box_w, platform_z + 1]);
    }
}

module riser_profile() {
    rb = half_box_z - 8;   // buried into the ring top
    translate([-riser_half_w, rb]) square([2 * riser_half_w, platform_z - rb]);
}

// Extrude a CONVEX 2D child along Y with 45-deg chamfers on both faces
module chamfer_extrude(T, c) {
    rotate([90, 0, 0]) {
        if (c <= 0) {
            linear_extrude(height = T, center = true) children();
        } else {
            hull() {
                translate([0, 0, -T / 2])
                    linear_extrude(height = 0.01) offset(delta = -c) children();
                translate([0, 0, -T / 2 + c])
                    linear_extrude(height = T - 2 * c) children();
                translate([0, 0, T / 2 - 0.01])
                    linear_extrude(height = 0.01) offset(delta = -c) children();
            }
        }
    }
}

// ---------------- Shared ring cuts ----------------
module bore_cuts() {
    translate([0, 0, bore_z]) rotate([90, 0, 0])
        cylinder(r = inner_r, h = half_box_h + 4, center = true);
    if (bore_chamfer > 0)
        for (m = [0, 1]) mirror([0, m, 0])
            translate([0, half_box_h / 2 + 0.01, bore_z]) rotate([90, 0, 0])
                cylinder(r1 = inner_r + bore_chamfer + 0.01, r2 = inner_r, h = bore_chamfer + 0.01);
}

module m5_cuts(tz) {
    for (side = [-1, 1])
        translate([side * bolt_offset_from_center, 0, tz / 2])
            cylinder(r = clamp_screw_dia / 2, h = tz + 4, center = true);
    for (side = [-1, 1])
        translate([side * bolt_offset_from_center, 0, shelf_height]) {
            cylinder(r = counterbore_dia / 2, h = tz);
            translate([side * outer_r / 2, 0, tz / 2])
                cube([outer_r, pocket_y_width, tz], center = true);
        }
}

// Text engraved into the front face (+Y), reading correctly from the front
module front_label(txt, zc) {
    translate([0, half_box_h / 2 - label_depth, zc])
        rotate([90, 0, 180])
        linear_extrude(height = label_depth + 0.1)
            text(txt, size = label_size, halign = "center", valign = "center",
                 font = "Liberation Sans:style=Bold");
}

// Captive nut tunnel + screw hole at x = sx
module nut_trap(sx, tol = nut_tol) {
    af = nut_af + tol;
    th = nut_thick + tol;
    nb = nut_top_z - th;                 // nut pocket bottom
    ys = (nut_entry == "back") ? -1 : 1;
    // Screw hole from platform down past the nut
    translate([sx, 0, nb - screw_tip_clear])
        cylinder(d = ring_screw_clear, h = platform_z - nb + screw_tip_clear + 1, $fn = 32);
    // Hex pocket at the screw axis (flats facing +/-X to match the tunnel walls)
    translate([sx, 0, nb])
        rotate([0, 0, 30]) cylinder(r = (af / 2) / cos(30), h = th, $fn = 6);
    // Slide-in tunnel to the chosen face
    translate([sx - af / 2, ys > 0 ? 0 : -(half_box_h / 2 + 1), nb])
        cube([af, half_box_h / 2 + 1, th]);
}

// Captive M5 nut slot in the bottom ring at x = sx (seam face at z = 0)
module bottom_nut_trap(sx, tol = bot_nut_tol) {
    bot_af = bot_nut_af + tol;
    bot_th = bot_nut_thick + tol;
    ys = (bot_nut_entry == "back") ? -1 : 1;
    // Blind clearance hole: seam face to past the nut, stops inside the ring
    translate([sx, 0, -1])
        cylinder(d = bot_screw_clear, h = bot_nut_roof + bot_th + bot_screw_tip_clear + 1, $fn = 40);
    // Hex pocket (flats facing +/-X to match the tunnel walls)
    translate([sx, 0, bot_nut_roof])
        rotate([0, 0, 30]) cylinder(r = (bot_af / 2) / cos(30), h = bot_th, $fn = 6);
    // Slide-in tunnel to the chosen face
    translate([sx - bot_af / 2, ys > 0 ? 0 : -(half_box_h / 2 + 1), bot_nut_roof])
        cube([bot_af, half_box_h / 2 + 1, bot_th]);
}

// ---------------- Ring halves ----------------
module ring_top(tol = nut_tol) {
    difference() {
        union() {
            chamfer_extrude(half_box_h, edge_chamfer) ring_profile_clipped();
            if (needs_riser)
                chamfer_extrude(half_box_h, edge_chamfer) riser_profile();
        }
        bore_cuts();
        m5_cuts(top_z_top);
        for (side = [-1, 1]) nut_trap(side * nut_x, tol);
        if (label_on)
            front_label(top_label, ((bore_z + inner_r) + platform_z) / 2);
    }
}

module ring_bottom(tol = bot_nut_tol) {
    difference() {
        chamfer_extrude(half_box_h, edge_chamfer) half_hex_profile();
        bore_cuts();
        if (bot_nut_trap)
            for (side = [-1, 1]) bottom_nut_trap(side * bolt_offset_from_center, tol);
        else
            m5_cuts(half_box_z);
        if (label_on)
            front_label(bottom_label, ((bore_z + inner_r) + half_box_z) / 2);
    }
}

// ---------------- Nut slot test blocks (slices of the real ring) ----------------
// Bottom ring: slice around the right-hand M5 slot. Seam face stays on the bed,
// real outer wall, full ring width (real tunnel length), real blind hole.
module test_bot_slice(tol) {
    af = bot_nut_af + tol;
    th = bot_nut_thick + tol;
    sx = bolt_offset_from_center;
    x0 = sx - af / 2 - test_wall;
    zt = bot_nut_roof + th + bot_screw_tip_clear + test_cap;
    difference() {
        intersection() {
            ring_bottom(tol);
            translate([x0, -half_box_h, -1]) cube([half_box_w, 2 * half_box_h, zt + 1]);
        }
        test_label(tol, sx, zt);
    }
}

// Top ring: slice around the right-hand clamp nut slot. Platform face is the
// real top surface (real roof), full ring width, real outer wall.
module test_clamp_slice(tol) {
    af = nut_af + tol;
    th = nut_thick + tol;
    sx = nut_x;
    x0 = sx - af / 2 - test_wall;
    x1 = sx + af / 2 + test_wall;
    zb = (nut_top_z - th) - screw_tip_clear - test_cap;
    translate([0, 0, -zb])
        intersection() {
            ring_top(tol);
            translate([x0, -half_box_h, zb]) cube([x1 - x0, 2 * half_box_h, platform_z - zb + 1]);
        }
}

// Tolerance engraved on the top face, front half (tunnel enters from the back)
module test_label(tol, x, ztop) {
    translate([x, half_box_h / 4, ztop - test_text_depth])
        linear_extrude(height = test_text_depth + 0.1)
            text(str(tol), size = test_text_size, halign = "center", valign = "center",
                 font = "Liberation Sans:style=Bold");
}

// Single test blocks, using the ring's own settings
module test_clamp_block() {
    difference() {
        test_clamp_slice(nut_tol);
        test_label(nut_tol, nut_x,
                   platform_z - ((nut_top_z - nut_thick - nut_tol) - screw_tip_clear - test_cap));
    }
}

module test_bot_block() {
    test_bot_slice(bot_nut_tol);
}

// ---------------- L-Clamp (local: inner face at x=0, bottom z=0, centered in Y) ----------------
// Cable trough on the clamp back face (local -Y): clamp face = inner side,
// trough_wall = outer side, open bottom and open at both ends (cable runs along X)
module cable_trough_shape() {
    y0 = -clamp_len / 2 - trough_width - trough_wall;
    th = trough_inner_h + trough_roof;
    difference() {
        translate([0, y0, 0]) cube([clamp_depth, trough_width + trough_wall + 0.01, th]);
        translate([-1, y0 + trough_wall, -1]) cube([clamp_depth + 2, trough_width, trough_inner_h + 1]);
    }
}

// Right-hand clamp geometry (x > 0 side); left-hand clamp is its mirror.
// Right = +X when looking from camera toward objective (panel up).
trough_right = cable_trough && (trough_clamp == "right" || trough_clamp == "both");
trough_left  = cable_trough && (trough_clamp == "left"  || trough_clamp == "both");

module clamp(with_trough = false) {
    clamp_body();
    if (with_trough) cable_trough_shape();
}

module clamp_body() {
    r = clamp_top_radius;
    difference() {
        union() {
            rotate([90, 0, 0]) linear_extrude(height = clamp_len, center = true)
                hull() {
                    square([clamp_depth - r, clamp_height]);
                    square([clamp_depth, clamp_height - r]);
                    translate([clamp_depth - r, clamp_height - r]) circle(r = r, $fn = 40);
                }
            hull() {
                translate([-tongue_length + 0.5, -tongue_width / 2, tongue_z])
                    cube([tongue_length - 0.5 + 0.01, tongue_width, tongue_thickness]);
                translate([-tongue_length, -tongue_width / 2 + 0.5, tongue_z + 0.5])
                    cube([0.01, tongue_width - 1, tongue_thickness - 1]);
            }
        }
        hull() for (dx = [-clamp_travel / 2, clamp_travel / 2])
            translate([clamp_depth / 2 + dx, 0, -1])
                cylinder(d = screw_clear, h = clamp_height + 2, $fn = 40);
        hull() for (dx = [-clamp_travel / 2, clamp_travel / 2])
            translate([clamp_depth / 2 + dx, 0, clamp_floor])
                cylinder(d = head_slot_w, h = head_pocket + 1, $fn = 40);
    }
}

// ---------------- Ghost foot (visual check only) ----------------
module ghost_foot() {
    difference() {
        translate([-foot_thickness, -foot_length / 2, 0])
            cube([foot_thickness, foot_length, foot_height + felt_thickness]);
        translate([-foot_thickness - 1, -foot_slot_len / 2, foot_slot_z + felt_thickness])
            cube([foot_thickness + 2, foot_slot_len, foot_slot_h]);
    }
}

// ---------------- Output ----------------
if (part == "ring_top") {
    ring_top();
} else if (part == "ring_bottom") {
    ring_bottom();
} else if (part == "test_bot_nut") {
    test_bot_block();
} else if (part == "test_clamp_nut") {
    test_clamp_block();
} else if (part == "clamp") {
    // Right clamp, and left clamp as its mirror, both on their side
    translate([0, 0, clamp_len / 2]) rotate([-90, 0, 0]) clamp(trough_right);          // right
    translate([-(2 * tongue_length + 5), 0, 0])
        mirror([1, 0, 0]) translate([0, 0, clamp_len / 2]) rotate([-90, 0, 0]) clamp(trough_left); // left
} else {
    ring_top();
    // Bottom half flipped under the top, gap shown
    translate([0, 0, -clamping_gap]) mirror([0, 0, 1]) color("silver") ring_bottom();
    for (side = [0, 1]) rotate([0, 0, side * 180]) {
        translate([clamp_x0, 0, platform_z]) color("tomato") {
            if (side == 0) clamp(trough_right); else mirror([0, 1, 0]) clamp(trough_left);
        }
        %translate([foot_face_x, 0, platform_z]) ghost_foot();
    }
}
