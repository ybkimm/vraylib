module vraylib

#flag -I @VMODROOT/c
#flag -l raylib

#include "raylib.h"

@[typedef]
struct C.Vector2 {
pub mut:
	x f32
	y f32
}

pub type Vector2 = C.Vector2

@[typedef]
struct C.Vector3 {
pub mut:
	x f32
	y f32
	z f32
}

pub type Vector3 = C.Vector3

@[typedef]
struct C.Vector4 {
pub mut:
	x f32
	y f32
	z f32
	w f32
}

pub type Vector4 = C.Vector4

pub type Quaternion = C.Vector4

@[typedef]
struct C.Matrix {
pub mut:
	m0  f32
	m4  f32
	m8  f32
	m12 f32
	m1  f32
	m5  f32
	m9  f32
	m13 f32
	m2  f32
	m6  f32
	m10 f32
	m14 f32
	m3  f32
	m7  f32
	m11 f32
	m15 f32
}

pub type Matrix = C.Matrix

@[typedef]
struct C.Color {
pub mut:
	r u8
	g u8
	b u8
	a u8
}

pub type Color = C.Color

@[typedef]
struct C.Rectangle {
pub mut:
	x      f32
	y      f32
	width  f32
	height f32
}

pub type Rectangle = C.Rectangle

@[typedef]
struct C.Image {
pub mut:
	data    voidptr
	width   int
	height  int
	mipmaps int
	format  int
}

pub type Image = C.Image

@[typedef]
struct C.Texture {
pub mut:
	id      u32
	width   int
	height  int
	mipmaps int
	format  int
}

pub type Texture = C.Texture

pub type Texture2D = C.Texture
pub type TextureCubemap = C.Texture

@[typedef]
struct C.RenderTexture {
pub mut:
	id      u32
	texture Texture
	depth   Texture
}

pub type RenderTexture = C.RenderTexture

pub type RenderTexture2D = C.RenderTexture

@[typedef]
struct C.NPatchInfo {
pub mut:
	source Rectangle
	left   int
	top    int
	right  int
	bottom int
	layout int
}

pub type NPatchInfo = C.NPatchInfo

@[typedef]
struct C.GlyphInfo {
pub mut:
	value    int
	offsetX  int
	offsetY  int
	advanceX int
	image    Image
}

pub type GlyphInfo = C.GlyphInfo

@[typedef]
struct C.Font {
pub mut:
	baseSize     int
	glyphCount   int
	glyphPadding int
	texture      Texture2D
	recs         &Rectangle
	glyphs       &GlyphInfo
}

pub type Font = C.Font

@[typedef]
struct C.Camera3D {
pub mut:
	position   Vector3
	target     Vector3
	up         Vector3
	fovy       f32
	projection int
}

pub type Camera3D = C.Camera3D

pub type Camera = C.Camera3D

@[typedef]
struct C.Camera2D {
pub mut:
	offset   Vector2
	target   Vector2
	rotation f32
	zoom     f32
}

pub type Camera2D = C.Camera2D

@[typedef]
struct C.Mesh {
pub mut:
	vertexCount   int
	triangleCount int
	vertices      &f32
	texcoords     &f32
	texcoords2    &f32
	normals       &f32
	tangents      &f32
	colors        &u8
	indices       &u16
	animVertices  &f32
	animNormals   &f32
	boneIds       &u8
	boneWeights   &f32
	vaoId         u32
	vboId         &u32
}

pub type Mesh = C.Mesh

@[typedef]
struct C.Shader {
pub mut:
	id   u32
	locs &int
}

pub type Shader = C.Shader

@[typedef]
struct C.MaterialMap {
pub mut:
	texture Texture2D
	color   Color
	value   f32
}

pub type MaterialMap = C.MaterialMap

@[typedef]
struct C.Material {
pub mut:
	shader Shader
	maps   &MaterialMap
	params [4]f32
}

pub type Material = C.Material

@[typedef]
struct C.Transform {
pub mut:
	translation Vector3
	rotation    Quaternion
	scale       Vector3
}

pub type Transform = C.Transform

@[typedef]
struct C.BoneInfo {
pub mut:
	name   [32]i8
	parent int
}

pub type BoneInfo = C.BoneInfo

@[typedef]
struct C.Model {
pub mut:
	transform     Matrix
	meshCount     int
	materialCount int
	meshes        &Mesh
	materials     &Material
	meshMaterial  &int
	boneCount     int
	bones         &BoneInfo
	bindPose      &Transform
}

pub type Model = C.Model

@[typedef]
struct C.ModelAnimation {
pub mut:
	boneCount  int
	frameCount int
	bones      &BoneInfo
	framePoses &&Transform
	name       [32]i8
}

pub type ModelAnimation = C.ModelAnimation

@[typedef]
struct C.Ray {
pub mut:
	position  Vector3
	direction Vector3
}

pub type Ray = C.Ray

@[typedef]
struct C.RayCollision {
pub mut:
	hit      bool
	distance f32
	point    Vector3
	normal   Vector3
}

pub type RayCollision = C.RayCollision

@[typedef]
struct C.BoundingBox {
pub mut:
	min Vector3
	max Vector3
}

pub type BoundingBox = C.BoundingBox

@[typedef]
struct C.Wave {
pub mut:
	frameCount u32
	sampleRate u32
	sampleSize u32
	channels   u32
	data       voidptr
}

pub type Wave = C.Wave

@[typedef]
struct C.AudioStream {
pub mut:
	buffer     C.rAudioBuffer
	processor  C.rAudioProcessor
	sampleRate u32
	sampleSize u32
	channels   u32
}

pub type AudioStream = C.AudioStream

@[typedef]
struct C.Sound {
pub mut:
	stream     AudioStream
	frameCount u32
}

pub type Sound = C.Sound

@[typedef]
struct C.Music {
pub mut:
	stream     AudioStream
	frameCount u32
	looping    bool
	ctxType    int
	ctxData    voidptr
}

pub type Music = C.Music

@[typedef]
struct C.VrDeviceInfo {
pub mut:
	hResolution            int
	vResolution            int
	hScreenSize            f32
	vScreenSize            f32
	eyeToScreenDistance    f32
	lensSeparationDistance f32
	interpupillaryDistance f32
	lensDistortionValues   [4]f32
	chromaAbCorrection     [4]f32
}

pub type VrDeviceInfo = C.VrDeviceInfo

@[typedef]
struct C.VrStereoConfig {
pub mut:
	projection        [2]Matrix
	viewOffset        [2]Matrix
	leftLensCenter    [2]f32
	rightLensCenter   [2]f32
	leftScreenCenter  [2]f32
	rightScreenCenter [2]f32
	scale             [2]f32
	scaleIn           [2]f32
}

pub type VrStereoConfig = C.VrStereoConfig

@[typedef]
struct C.FilePathList {
pub mut:
	capacity u32
	count    u32
	paths    &&u8
}

pub type FilePathList = C.FilePathList

@[typedef]
struct C.AutomationEvent {
pub mut:
	frame  u32
	type_  u32
	params [4]int
}

pub type AutomationEvent = C.AutomationEvent

@[typedef]
struct C.AutomationEventList {
pub mut:
	capacity u32
	count    u32
	events   &AutomationEvent
}

pub type AutomationEventList = C.AutomationEventList

pub const (
    lightgray  = Color{ 200, 200, 200, 255 }
    gray       = Color{ 130, 130, 130, 255 }
    darkgray   = Color{ 80, 80, 80, 255 }
    yellow     = Color{ 253, 249, 0, 255 }
    gold       = Color{ 255, 203, 0, 255 }
    orange     = Color{ 255, 161, 0, 255 }
    pink       = Color{ 255, 109, 194, 255 }
    red        = Color{ 230, 41, 55, 255 }
    maroon     = Color{ 190, 33, 55, 255 }
    green      = Color{ 0, 228, 48, 255 }
    lime       = Color{ 0, 158, 47, 255 }
    darkgreen  = Color{ 0, 117, 44, 255 }
    skyblue    = Color{ 102, 191, 255, 255 }
    blue       = Color{ 0, 121, 241, 255 }
    darkblue   = Color{ 0, 82, 172, 255 }
    purple     = Color{ 200, 122, 255, 255 }
    violet     = Color{ 135, 60, 190, 255 }
    darkpurple = Color{ 112, 31, 126, 255 }
    beige      = Color{ 211, 176, 131, 255 }
    brown      = Color{ 127, 106, 79, 255 }
    darkbrown  = Color{ 76, 63, 47, 255 }

    white      = Color{ 255, 255, 255, 255 }
    black      = Color{ 0, 0, 0, 255 }
    blank      = Color{ 0, 0, 0, 0 }
    magenta    = Color{ 255, 0, 255, 255 }
    raywhite   = Color{ 245, 245, 245, 255 }
)

pub enum ConfigFlags {
	flag_vsync_hint               = 64
	flag_fullscreen_mode          = 2
	flag_window_resizable         = 4
	flag_window_undecorated       = 8
	flag_window_hidden            = 128
	flag_window_minimized         = 512
	flag_window_maximized         = 1024
	flag_window_unfocused         = 2048
	flag_window_topmost           = 4096
	flag_window_always_run        = 256
	flag_window_transparent       = 16
	flag_window_highdpi           = 8192
	flag_window_mouse_passthrough = 16384
	flag_borderless_windowed_mode = 32768
	flag_msaa_4x_hint             = 32
	flag_interlaced_hint          = 65536
}

pub enum TraceLogLevel {
	log_all     = 0
	log_trace
	log_debug
	log_info
	log_warning
	log_error
	log_fatal
	log_none
}

pub enum KeyboardKey {
	key_null          = 0
	key_apostrophe    = 39
	key_comma         = 44
	key_minus         = 45
	key_period        = 46
	key_slash         = 47
	key_zero          = 48
	key_one           = 49
	key_two           = 50
	key_three         = 51
	key_four          = 52
	key_five          = 53
	key_six           = 54
	key_seven         = 55
	key_eight         = 56
	key_nine          = 57
	key_semicolon     = 59
	key_equal         = 61
	key_a             = 65
	key_b             = 66
	key_c             = 67
	key_d             = 68
	key_e             = 69
	key_f             = 70
	key_g             = 71
	key_h             = 72
	key_i             = 73
	key_j             = 74
	key_k             = 75
	key_l             = 76
	key_m             = 77
	key_n             = 78
	key_o             = 79
	key_p             = 80
	key_q             = 81
	key_r             = 82
	key_s             = 83
	key_t             = 84
	key_u             = 85
	key_v             = 86
	key_w             = 87
	key_x             = 88
	key_y             = 89
	key_z             = 90
	key_left_bracket  = 91
	key_backslash     = 92
	key_right_bracket = 93
	key_grave         = 96
	key_space         = 32
	key_escape        = 256
	key_enter         = 257
	key_tab           = 258
	key_backspace     = 259
	key_insert        = 260
	key_delete        = 261
	key_right         = 262
	key_left          = 263
	key_down          = 264
	key_up            = 265
	key_page_up       = 266
	key_page_down     = 267
	key_home          = 268
	key_end           = 269
	key_caps_lock     = 280
	key_scroll_lock   = 281
	key_num_lock      = 282
	key_print_screen  = 283
	key_pause         = 284
	key_f1            = 290
	key_f2            = 291
	key_f3            = 292
	key_f4            = 293
	key_f5            = 294
	key_f6            = 295
	key_f7            = 296
	key_f8            = 297
	key_f9            = 298
	key_f10           = 299
	key_f11           = 300
	key_f12           = 301
	key_left_shift    = 340
	key_left_control  = 341
	key_left_alt      = 342
	key_left_super    = 343
	key_right_shift   = 344
	key_right_control = 345
	key_right_alt     = 346
	key_right_super   = 347
	key_kb_menu       = 348
	key_kp_0          = 320
	key_kp_1          = 321
	key_kp_2          = 322
	key_kp_3          = 323
	key_kp_4          = 324
	key_kp_5          = 325
	key_kp_6          = 326
	key_kp_7          = 327
	key_kp_8          = 328
	key_kp_9          = 329
	key_kp_decimal    = 330
	key_kp_divide     = 331
	key_kp_multiply   = 332
	key_kp_subtract   = 333
	key_kp_add        = 334
	key_kp_enter      = 335
	key_kp_equal      = 336
	key_back          = 4
	key_menu          = 5
	key_volume_up     = 24
	key_volume_down   = 25
}

pub enum MouseButton {
	mouse_button_left    = 0
	mouse_button_right   = 1
	mouse_button_middle  = 2
	mouse_button_side    = 3
	mouse_button_extra   = 4
	mouse_button_forward = 5
	mouse_button_back    = 6
}

pub enum MouseCursor {
	mouse_cursor_default       = 0
	mouse_cursor_arrow         = 1
	mouse_cursor_ibeam         = 2
	mouse_cursor_crosshair     = 3
	mouse_cursor_pointing_hand = 4
	mouse_cursor_resize_ew     = 5
	mouse_cursor_resize_ns     = 6
	mouse_cursor_resize_nwse   = 7
	mouse_cursor_resize_nesw   = 8
	mouse_cursor_resize_all    = 9
	mouse_cursor_not_allowed   = 10
}

pub enum GamepadButton {
	gamepad_button_unknown          = 0
	gamepad_button_left_face_up
	gamepad_button_left_face_right
	gamepad_button_left_face_down
	gamepad_button_left_face_left
	gamepad_button_right_face_up
	gamepad_button_right_face_right
	gamepad_button_right_face_down
	gamepad_button_right_face_left
	gamepad_button_left_trigger_1
	gamepad_button_left_trigger_2
	gamepad_button_right_trigger_1
	gamepad_button_right_trigger_2
	gamepad_button_middle_left
	gamepad_button_middle
	gamepad_button_middle_right
	gamepad_button_left_thumb
	gamepad_button_right_thumb
}

pub enum GamepadAxis {
	gamepad_axis_left_x        = 0
	gamepad_axis_left_y        = 1
	gamepad_axis_right_x       = 2
	gamepad_axis_right_y       = 3
	gamepad_axis_left_trigger  = 4
	gamepad_axis_right_trigger = 5
}

pub enum MaterialMapIndex {
	material_map_albedo     = 0
	material_map_metalness
	material_map_normal
	material_map_roughness
	material_map_occlusion
	material_map_emission
	material_map_height
	material_map_cubemap
	material_map_irradiance
	material_map_prefilter
	material_map_brdf
}

pub enum ShaderLocationIndex {
	shader_loc_vertex_position   = 0
	shader_loc_vertex_texcoord01
	shader_loc_vertex_texcoord02
	shader_loc_vertex_normal
	shader_loc_vertex_tangent
	shader_loc_vertex_color
	shader_loc_matrix_mvp
	shader_loc_matrix_view
	shader_loc_matrix_projection
	shader_loc_matrix_model
	shader_loc_matrix_normal
	shader_loc_vector_view
	shader_loc_color_diffuse
	shader_loc_color_specular
	shader_loc_color_ambient
	shader_loc_map_albedo
	shader_loc_map_metalness
	shader_loc_map_normal
	shader_loc_map_roughness
	shader_loc_map_occlusion
	shader_loc_map_emission
	shader_loc_map_height
	shader_loc_map_cubemap
	shader_loc_map_irradiance
	shader_loc_map_prefilter
	shader_loc_map_brdf
}

pub enum ShaderUniformDataType {
	shader_uniform_float     = 0
	shader_uniform_vec2
	shader_uniform_vec3
	shader_uniform_vec4
	shader_uniform_int
	shader_uniform_ivec2
	shader_uniform_ivec3
	shader_uniform_ivec4
	shader_uniform_sampler2d
}

pub enum ShaderAttributeDataType {
	shader_attrib_float = 0
	shader_attrib_vec2
	shader_attrib_vec3
	shader_attrib_vec4
}

pub enum PixelFormat {
	pixelformat_uncompressed_grayscale    = 1
	pixelformat_uncompressed_gray_alpha
	pixelformat_uncompressed_r5g6b5
	pixelformat_uncompressed_r8g8b8
	pixelformat_uncompressed_r5g5b5a1
	pixelformat_uncompressed_r4g4b4a4
	pixelformat_uncompressed_r8g8b8a8
	pixelformat_uncompressed_r32
	pixelformat_uncompressed_r32g32b32
	pixelformat_uncompressed_r32g32b32a32
	pixelformat_uncompressed_r16
	pixelformat_uncompressed_r16g16b16
	pixelformat_uncompressed_r16g16b16a16
	pixelformat_compressed_dxt1_rgb
	pixelformat_compressed_dxt1_rgba
	pixelformat_compressed_dxt3_rgba
	pixelformat_compressed_dxt5_rgba
	pixelformat_compressed_etc1_rgb
	pixelformat_compressed_etc2_rgb
	pixelformat_compressed_etc2_eac_rgba
	pixelformat_compressed_pvrt_rgb
	pixelformat_compressed_pvrt_rgba
	pixelformat_compressed_astc_4x4_rgba
	pixelformat_compressed_astc_8x8_rgba
}

pub enum TextureFilter {
	texture_filter_point           = 0
	texture_filter_bilinear
	texture_filter_trilinear
	texture_filter_anisotropic_4x
	texture_filter_anisotropic_8x
	texture_filter_anisotropic_16x
}

pub enum TextureWrap {
	texture_wrap_repeat        = 0
	texture_wrap_clamp
	texture_wrap_mirror_repeat
	texture_wrap_mirror_clamp
}

pub enum CubemapLayout {
	cubemap_layout_auto_detect         = 0
	cubemap_layout_line_vertical
	cubemap_layout_line_horizontal
	cubemap_layout_cross_three_by_four
	cubemap_layout_cross_four_by_three
	cubemap_layout_panorama
}

pub enum FontType {
	font_default = 0
	font_bitmap
	font_sdf
}

pub enum BlendMode {
	blend_alpha             = 0
	blend_additive
	blend_multiplied
	blend_add_colors
	blend_subtract_colors
	blend_alpha_premultiply
	blend_custom
	blend_custom_separate
}

pub enum Gesture {
	gesture_none        = 0
	gesture_tap         = 1
	gesture_doubletap   = 2
	gesture_hold        = 4
	gesture_drag        = 8
	gesture_swipe_right = 16
	gesture_swipe_left  = 32
	gesture_swipe_up    = 64
	gesture_swipe_down  = 128
	gesture_pinch_in    = 256
	gesture_pinch_out   = 512
}

pub enum CameraMode {
	camera_custom       = 0
	camera_free
	camera_orbital
	camera_first_person
	camera_third_person
}

pub enum CameraProjection {
	camera_perspective  = 0
	camera_orthographic
}

pub enum NPatchLayout {
	npatch_nine_patch             = 0
	npatch_three_patch_vertical
	npatch_three_patch_horizontal
}

pub type AudioCallback = fn (voidptr, u32)

fn C.InitWindow(width int, height int, title &u8)

@[inline]
pub fn init_window(width int, height int, title string) {
	C.InitWindow(width, height, title.str)
}

fn C.CloseWindow()

@[inline]
pub fn close_window() {
	C.CloseWindow()
}

fn C.WindowShouldClose() bool

@[inline]
pub fn window_should_close() bool {
	return C.WindowShouldClose()
}

fn C.IsWindowReady() bool

@[inline]
pub fn is_window_ready() bool {
	return C.IsWindowReady()
}

fn C.IsWindowFullscreen() bool

@[inline]
pub fn is_window_fullscreen() bool {
	return C.IsWindowFullscreen()
}

fn C.IsWindowHidden() bool

@[inline]
pub fn is_window_hidden() bool {
	return C.IsWindowHidden()
}

fn C.IsWindowMinimized() bool

@[inline]
pub fn is_window_minimized() bool {
	return C.IsWindowMinimized()
}

fn C.IsWindowMaximized() bool

@[inline]
pub fn is_window_maximized() bool {
	return C.IsWindowMaximized()
}

fn C.IsWindowFocused() bool

@[inline]
pub fn is_window_focused() bool {
	return C.IsWindowFocused()
}

fn C.IsWindowResized() bool

@[inline]
pub fn is_window_resized() bool {
	return C.IsWindowResized()
}

fn C.IsWindowState(flag u32) bool

@[inline]
pub fn is_window_state(flag u32) bool {
	return C.IsWindowState(flag)
}

fn C.SetWindowState(flags u32)

@[inline]
pub fn set_window_state(flags u32) {
	C.SetWindowState(flags)
}

fn C.ClearWindowState(flags u32)

@[inline]
pub fn clear_window_state(flags u32) {
	C.ClearWindowState(flags)
}

fn C.ToggleFullscreen()

@[inline]
pub fn toggle_fullscreen() {
	C.ToggleFullscreen()
}

fn C.ToggleBorderlessWindowed()

@[inline]
pub fn toggle_borderless_windowed() {
	C.ToggleBorderlessWindowed()
}

fn C.MaximizeWindow()

@[inline]
pub fn maximize_window() {
	C.MaximizeWindow()
}

fn C.MinimizeWindow()

@[inline]
pub fn minimize_window() {
	C.MinimizeWindow()
}

fn C.RestoreWindow()

@[inline]
pub fn restore_window() {
	C.RestoreWindow()
}

fn C.SetWindowIcon(image Image)

@[inline]
pub fn set_window_icon(image Image) {
	C.SetWindowIcon(image)
}

fn C.SetWindowIcons(images &Image, count int)

@[inline]
pub fn set_window_icons(images []Image) {
	C.SetWindowIcons(images.data, images.len)
}

fn C.SetWindowTitle(title &u8)

@[inline]
pub fn set_window_title(title string) {
	C.SetWindowTitle(title.str)
}

fn C.SetWindowPosition(x int, y int)

@[inline]
pub fn set_window_position(x int, y int) {
	C.SetWindowPosition(x, y)
}

fn C.SetWindowMonitor(monitor int)

@[inline]
pub fn set_window_monitor(monitor int) {
	C.SetWindowMonitor(monitor)
}

fn C.SetWindowMinSize(width int, height int)

@[inline]
pub fn set_window_min_size(width int, height int) {
	C.SetWindowMinSize(width, height)
}

fn C.SetWindowMaxSize(width int, height int)

@[inline]
pub fn set_window_max_size(width int, height int) {
	C.SetWindowMaxSize(width, height)
}

fn C.SetWindowSize(width int, height int)

@[inline]
pub fn set_window_size(width int, height int) {
	C.SetWindowSize(width, height)
}

fn C.SetWindowOpacity(opacity f32)

@[inline]
pub fn set_window_opacity(opacity f32) {
	C.SetWindowOpacity(opacity)
}

fn C.SetWindowFocused()

@[inline]
pub fn set_window_focused() {
	C.SetWindowFocused()
}

fn C.GetWindowHandle() voidptr

@[inline]
pub fn get_window_handle() voidptr {
	return C.GetWindowHandle()
}

fn C.GetScreenWidth() int

@[inline]
pub fn get_screen_width() int {
	return C.GetScreenWidth()
}

fn C.GetScreenHeight() int

@[inline]
pub fn get_screen_height() int {
	return C.GetScreenHeight()
}

fn C.GetRenderWidth() int

@[inline]
pub fn get_render_width() int {
	return C.GetRenderWidth()
}

fn C.GetRenderHeight() int

@[inline]
pub fn get_render_height() int {
	return C.GetRenderHeight()
}

fn C.GetMonitorCount() int

@[inline]
pub fn get_monitor_count() int {
	return C.GetMonitorCount()
}

fn C.GetCurrentMonitor() int

@[inline]
pub fn get_current_monitor() int {
	return C.GetCurrentMonitor()
}

fn C.GetMonitorPosition(monitor int) Vector2

@[inline]
pub fn get_monitor_position(monitor int) Vector2 {
	return C.GetMonitorPosition(monitor)
}

fn C.GetMonitorWidth(monitor int) int

@[inline]
pub fn get_monitor_width(monitor int) int {
	return C.GetMonitorWidth(monitor)
}

fn C.GetMonitorHeight(monitor int) int

@[inline]
pub fn get_monitor_height(monitor int) int {
	return C.GetMonitorHeight(monitor)
}

fn C.GetMonitorPhysicalWidth(monitor int) int

@[inline]
pub fn get_monitor_physical_width(monitor int) int {
	return C.GetMonitorPhysicalWidth(monitor)
}

fn C.GetMonitorPhysicalHeight(monitor int) int

@[inline]
pub fn get_monitor_physical_height(monitor int) int {
	return C.GetMonitorPhysicalHeight(monitor)
}

fn C.GetMonitorRefreshRate(monitor int) int

@[inline]
pub fn get_monitor_refresh_rate(monitor int) int {
	return C.GetMonitorRefreshRate(monitor)
}

fn C.GetWindowPosition() Vector2

@[inline]
pub fn get_window_position() Vector2 {
	return C.GetWindowPosition()
}

fn C.GetWindowScaleDPI() Vector2

@[inline]
pub fn get_window_scale_dpi() Vector2 {
	return C.GetWindowScaleDPI()
}

fn C.GetMonitorName(monitor int) &u8

@[inline]
pub fn get_monitor_name(monitor int) string {
	cstr := C.GetMonitorName(monitor)
	return unsafe { tos_clone(cstr) }
}

fn C.SetClipboardText(text &u8)

@[inline]
pub fn set_clipboard_text(text string) {
	C.SetClipboardText(text.str)
}

fn C.GetClipboardText() &u8

@[inline]
pub fn get_clipboard_text() string {
	cstr := C.GetClipboardText()
	return unsafe { tos_clone(cstr) }
}

fn C.EnableEventWaiting()

@[inline]
pub fn enable_event_waiting() {
	C.EnableEventWaiting()
}

fn C.DisableEventWaiting()

@[inline]
pub fn disable_event_waiting() {
	C.DisableEventWaiting()
}

fn C.ShowCursor()

@[inline]
pub fn show_cursor() {
	C.ShowCursor()
}

fn C.HideCursor()

@[inline]
pub fn hide_cursor() {
	C.HideCursor()
}

fn C.IsCursorHidden() bool

@[inline]
pub fn is_cursor_hidden() bool {
	return C.IsCursorHidden()
}

fn C.EnableCursor()

@[inline]
pub fn enable_cursor() {
	C.EnableCursor()
}

fn C.DisableCursor()

@[inline]
pub fn disable_cursor() {
	C.DisableCursor()
}

fn C.IsCursorOnScreen() bool

@[inline]
pub fn is_cursor_on_screen() bool {
	return C.IsCursorOnScreen()
}

fn C.ClearBackground(color Color)

@[inline]
pub fn clear_background(color Color) {
	C.ClearBackground(color)
}

fn C.BeginDrawing()

@[inline]
pub fn begin_drawing() {
	C.BeginDrawing()
}

fn C.EndDrawing()

@[inline]
pub fn end_drawing() {
	C.EndDrawing()
}

fn C.BeginMode2D(camera Camera2D)

@[inline]
pub fn begin_mode_2d(camera Camera2D) {
	C.BeginMode2D(camera)
}

fn C.EndMode2D()

@[inline]
pub fn end_mode_2d() {
	C.EndMode2D()
}

fn C.BeginMode3D(camera Camera3D)

@[inline]
pub fn begin_mode_3d(camera Camera3D) {
	C.BeginMode3D(camera)
}

fn C.EndMode3D()

@[inline]
pub fn end_mode_3d() {
	C.EndMode3D()
}

fn C.BeginTextureMode(target RenderTexture2D)

@[inline]
pub fn begin_texture_mode(target RenderTexture2D) {
	C.BeginTextureMode(target)
}

fn C.EndTextureMode()

@[inline]
pub fn end_texture_mode() {
	C.EndTextureMode()
}

fn C.BeginShaderMode(shader Shader)

@[inline]
pub fn begin_shader_mode(shader Shader) {
	C.BeginShaderMode(shader)
}

fn C.EndShaderMode()

@[inline]
pub fn end_shader_mode() {
	C.EndShaderMode()
}

fn C.BeginBlendMode(mode int)

@[inline]
pub fn begin_blend_mode(mode int) {
	C.BeginBlendMode(mode)
}

fn C.EndBlendMode()

@[inline]
pub fn end_blend_mode() {
	C.EndBlendMode()
}

fn C.BeginScissorMode(x int, y int, width int, height int)

@[inline]
pub fn begin_scissor_mode(x int, y int, width int, height int) {
	C.BeginScissorMode(x, y, width, height)
}

fn C.EndScissorMode()

@[inline]
pub fn end_scissor_mode() {
	C.EndScissorMode()
}

fn C.BeginVrStereoMode(config VrStereoConfig)

@[inline]
pub fn begin_vr_stereo_mode(config VrStereoConfig) {
	C.BeginVrStereoMode(config)
}

fn C.EndVrStereoMode()

@[inline]
pub fn end_vr_stereo_mode() {
	C.EndVrStereoMode()
}

fn C.LoadVrStereoConfig(device VrDeviceInfo) VrStereoConfig

@[inline]
pub fn load_vr_stereo_config(device VrDeviceInfo) VrStereoConfig {
	return C.LoadVrStereoConfig(device)
}

fn C.UnloadVrStereoConfig(config VrStereoConfig)

@[inline]
pub fn unload_vr_stereo_config(config VrStereoConfig) {
	C.UnloadVrStereoConfig(config)
}

fn C.LoadShader(vsfilename &u8, fsfilename &u8) Shader

@[inline]
pub fn load_shader(vsfilename string, fsfilename string) Shader {
	return C.LoadShader(vsfilename.str, fsfilename.str)
}

fn C.LoadShaderFromMemory(vscode &u8, fscode &u8) Shader

@[inline]
pub fn load_shader_from_memory(vscode string, fscode string) Shader {
	return C.LoadShaderFromMemory(vscode.str, fscode.str)
}

fn C.IsShaderReady(shader Shader) bool

@[inline]
pub fn is_shader_ready(shader Shader) bool {
	return C.IsShaderReady(shader)
}

fn C.GetShaderLocation(shader Shader, uniformname &u8) int

@[inline]
pub fn get_shader_location(shader Shader, uniformname string) int {
	return C.GetShaderLocation(shader, uniformname.str)
}

fn C.GetShaderLocationAttrib(shader Shader, attribname &u8) int

@[inline]
pub fn get_shader_location_attrib(shader Shader, attribname string) int {
	return C.GetShaderLocationAttrib(shader, attribname.str)
}

@[keep_args_alive]
fn C.SetShaderValue(shader Shader, locindex int, value voidptr, uniformtype int)

@[inline]
pub fn set_shader_value(shader Shader, locindex int, value voidptr, uniformtype int) {
	C.SetShaderValue(shader, locindex, value, uniformtype)
}

@[keep_args_alive]
fn C.SetShaderValueV(shader Shader, locindex int, value voidptr, uniformtype int, count int)

@[inline]
pub fn set_shader_value_v(shader Shader, locindex int, value voidptr, uniformtype int, count int) {
	C.SetShaderValueV(shader, locindex, value, uniformtype, count)
}

fn C.SetShaderValueMatrix(shader Shader, locindex int, mat Matrix)

@[inline]
pub fn set_shader_value_matrix(shader Shader, locindex int, mat Matrix) {
	C.SetShaderValueMatrix(shader, locindex, mat)
}

fn C.SetShaderValueTexture(shader Shader, locindex int, texture Texture2D)

@[inline]
pub fn set_shader_value_texture(shader Shader, locindex int, texture Texture2D) {
	C.SetShaderValueTexture(shader, locindex, texture)
}

fn C.UnloadShader(shader Shader)

@[inline]
pub fn unload_shader(shader Shader) {
	C.UnloadShader(shader)
}

fn C.GetMouseRay(mouseposition Vector2, camera Camera) Ray

@[inline]
pub fn get_mouse_ray(mouseposition Vector2, camera Camera) Ray {
	return C.GetMouseRay(mouseposition, camera)
}

fn C.GetCameraMatrix(camera Camera) Matrix

@[inline]
pub fn get_camera_matrix(camera Camera) Matrix {
	return C.GetCameraMatrix(camera)
}

fn C.GetCameraMatrix2D(camera Camera2D) Matrix

@[inline]
pub fn get_camera_matrix_2d(camera Camera2D) Matrix {
	return C.GetCameraMatrix2D(camera)
}

fn C.GetWorldToScreen(position Vector3, camera Camera) Vector2

@[inline]
pub fn get_world_to_screen(position Vector3, camera Camera) Vector2 {
	return C.GetWorldToScreen(position, camera)
}

fn C.GetScreenToWorld2D(position Vector2, camera Camera2D) Vector2

@[inline]
pub fn get_screen_to_world_2d(position Vector2, camera Camera2D) Vector2 {
	return C.GetScreenToWorld2D(position, camera)
}

fn C.GetWorldToScreenEx(position Vector3, camera Camera, width int, height int) Vector2

@[inline]
pub fn get_world_to_screen_ex(position Vector3, camera Camera, width int, height int) Vector2 {
	return C.GetWorldToScreenEx(position, camera, width, height)
}

fn C.GetWorldToScreen2D(position Vector2, camera Camera2D) Vector2

@[inline]
pub fn get_world_to_screen_2d(position Vector2, camera Camera2D) Vector2 {
	return C.GetWorldToScreen2D(position, camera)
}

fn C.SetTargetFPS(fps int)

@[inline]
pub fn set_target_fps(fps int) {
	C.SetTargetFPS(fps)
}

fn C.GetFrameTime() f32

@[inline]
pub fn get_frame_time() f32 {
	return C.GetFrameTime()
}

fn C.GetTime() f64

@[inline]
pub fn get_time() f64 {
	return C.GetTime()
}

fn C.GetFPS() int

@[inline]
pub fn get_fps() int {
	return C.GetFPS()
}

/* Manual frame control; end_drawing() does this job, and can not be disabled
   because we need to modify config.h manually.

fn C.SwapScreenBuffer()

@[inline]
pub fn swap_screen_buffer() {
	C.SwapScreenBuffer()
}

fn C.PollInputEvents()

@[inline]
pub fn poll_input_events() {
	C.PollInputEvents()
}
*/

fn C.WaitTime(seconds f64)

@[inline]
pub fn wait_time(seconds f64) {
	C.WaitTime(seconds)
}

fn C.SetRandomSeed(seed u32)

@[inline]
pub fn set_random_seed(seed u32) {
	C.SetRandomSeed(seed)
}

fn C.GetRandomValue(min int, max int) int

@[inline]
pub fn get_random_value(min int, max int) int {
	return C.GetRandomValue(min, max)
}

fn C.LoadRandomSequence(count u32, min int, max int) &int

fn C.UnloadRandomSequence(sequence &int)

pub fn random_sequence(mut out []int, min int, max int) {
	count := out.len

	seq := C.LoadRandomSequence(count, min, max)

	for i in 0..count {
		out[i] = seq[i]
	}

	C.UnloadRandomSequence(seq)
}

fn C.TakeScreenshot(filename &u8)

@[inline]
pub fn take_screenshot(filename string) {
	C.TakeScreenshot(filename.str)
}

fn C.SetConfigFlags(flags u32)

@[inline]
pub fn set_config_flags(flags u32) {
	C.SetConfigFlags(flags)
}

fn C.OpenURL(url &u8)

@[inline]
pub fn open_url(url string) {
	C.OpenURL(url.str)
}

fn C.TraceLog(loglevel int, args ...&u8)

@[inline]
pub fn trace_log(loglevel int, text string) {
	// The TraceLog is printf-like function. but since V supports
	// string interpolation, we can just pass the string
	C.TraceLog(loglevel, text.str)
}

fn C.SetTraceLogLevel(loglevel int)

@[inline]
pub fn set_trace_log_level(loglevel int) {
	C.SetTraceLogLevel(loglevel)
}

fn C.MemAlloc(size u32) voidptr

@[unsafe]
@[inline]
pub fn mem_alloc(size u32) voidptr {
	return C.MemAlloc(size)
}

fn C.MemRealloc(ptr voidptr, size u32) voidptr

@[unsafe]
@[inline]
pub fn mem_realloc(ptr voidptr, size u32) voidptr {
	return C.MemRealloc(ptr, size)
}

fn C.MemFree(ptr voidptr)

@[unsafe]
@[inline]
pub fn mem_free(ptr voidptr) {
	C.MemFree(ptr)
}

// TODO: Drag-and-drop support
fn C.IsFileDropped() bool

@[inline]
pub fn is_file_dropped() bool {
	return C.IsFileDropped()
}

fn C.LoadDroppedFiles() FilePathList

fn C.UnloadDroppedFiles(files FilePathList)

// TODO: Automation Event support
fn C.LoadAutomationEventList(filename &i8) AutomationEventList

fn C.UnloadAutomationEventList(list AutomationEventList)

fn C.SetAutomationEventList(list &AutomationEventList)

fn C.SetAutomationEventBaseFrame(frame int)

fn C.StartAutomationEventRecording()

fn C.StopAutomationEventRecording()

fn C.PlayAutomationEvent(event AutomationEvent)

fn C.IsKeyPressed(key int) bool

@[inline]
pub fn is_key_pressed(key int) bool {
	return C.IsKeyPressed(key)
}

fn C.IsKeyPressedRepeat(key int) bool

@[inline]
pub fn is_key_pressed_repeat(key int) bool {
	return C.IsKeyPressedRepeat(key)
}

fn C.IsKeyDown(key int) bool

@[inline]
pub fn is_key_down(key int) bool {
	return C.IsKeyDown(key)
}

fn C.IsKeyReleased(key int) bool

@[inline]
pub fn is_key_released(key int) bool {
	return C.IsKeyReleased(key)
}

fn C.IsKeyUp(key int) bool

@[inline]
pub fn is_key_up(key int) bool {
	return C.IsKeyUp(key)
}

fn C.GetKeyPressed() int

@[inline]
pub fn get_key_pressed() int {
	return C.GetKeyPressed()
}

fn C.GetCharPressed() int

@[inline]
pub fn get_char_pressed() int {
	return C.GetCharPressed()
}

fn C.SetExitKey(key int)

@[inline]
pub fn set_exit_key(key int) {
	C.SetExitKey(key)
}

fn C.IsGamepadAvailable(gamepad int) bool

@[inline]
pub fn is_gamepad_available(gamepad int) bool {
	return C.IsGamepadAvailable(gamepad)
}

fn C.GetGamepadName(gamepad int) &u8

@[inline]
pub fn get_gamepad_name(gamepad int) string {
	cstr := C.GetGamepadName(gamepad)
	return unsafe { tos_clone(cstr) }
}

fn C.IsGamepadButtonPressed(gamepad int, button int) bool

@[inline]
pub fn is_gamepad_button_pressed(gamepad int, button int) bool {
	return C.IsGamepadButtonPressed(gamepad, button)
}

fn C.IsGamepadButtonDown(gamepad int, button int) bool

@[inline]
pub fn is_gamepad_button_down(gamepad int, button int) bool {
	return C.IsGamepadButtonDown(gamepad, button)
}

fn C.IsGamepadButtonReleased(gamepad int, button int) bool

@[inline]
pub fn is_gamepad_button_released(gamepad int, button int) bool {
	return C.IsGamepadButtonReleased(gamepad, button)
}

fn C.IsGamepadButtonUp(gamepad int, button int) bool

@[inline]
pub fn is_gamepad_button_up(gamepad int, button int) bool {
	return C.IsGamepadButtonUp(gamepad, button)
}

fn C.GetGamepadButtonPressed() int

@[inline]
pub fn get_gamepad_button_pressed() int {
	return C.GetGamepadButtonPressed()
}

fn C.GetGamepadAxisCount(gamepad int) int

@[inline]
pub fn get_gamepad_axis_count(gamepad int) int {
	return C.GetGamepadAxisCount(gamepad)
}

fn C.GetGamepadAxisMovement(gamepad int, axis int) f32

@[inline]
pub fn get_gamepad_axis_movement(gamepad int, axis int) f32 {
	return C.GetGamepadAxisMovement(gamepad, axis)
}

// internal function
//fn C.SetGamepadMappings(mappings string) int

fn C.GetMouseX() int

@[inline]
pub fn get_mouse_x() int {
	return C.GetMouseX()
}

fn C.GetMouseY() int

@[inline]
pub fn get_mouse_y() int {
	return C.GetMouseY()
}

fn C.GetMousePosition() Vector2

@[inline]
pub fn get_mouse_position() Vector2 {
	return C.GetMousePosition()
}

fn C.GetMouseDelta() Vector2

@[inline]
pub fn get_mouse_delta() Vector2 {
	return C.GetMouseDelta()
}

fn C.SetMousePosition(x int, y int)

@[inline]
pub fn set_mouse_position(x int, y int) {
	C.SetMousePosition(x, y)
}

fn C.SetMouseOffset(offsetx int, offsety int)

@[inline]
pub fn set_mouse_offset(offsetx int, offsety int) {
	C.SetMouseOffset(offsetx, offsety)
}

fn C.SetMouseScale(scalex f32, scaley f32)

@[inline]
pub fn set_mouse_scale(scalex f32, scaley f32) {
	C.SetMouseScale(scalex, scaley)
}

fn C.GetMouseWheelMove() f32

@[inline]
pub fn get_mouse_wheel_move() f32 {
	return C.GetMouseWheelMove()
}

fn C.GetMouseWheelMoveV() Vector2

@[inline]
pub fn get_mouse_wheel_move_v() Vector2 {
	return C.GetMouseWheelMoveV()
}

fn C.SetMouseCursor(cursor int)

@[inline]
pub fn set_mouse_cursor(cursor int) {
	C.SetMouseCursor(cursor)
}

fn C.GetTouchX() int

@[inline]
pub fn get_touch_x() int {
	return C.GetTouchX()
}

fn C.GetTouchY() int

@[inline]
pub fn get_touch_y() int {
	return C.GetTouchY()
}

fn C.GetTouchPosition(index int) Vector2

@[inline]
pub fn get_touch_position(index int) Vector2 {
	return C.GetTouchPosition(index)
}

fn C.GetTouchPointId(index int) int

@[inline]
pub fn get_touch_point_id(index int) int {
	return C.GetTouchPointId(index)
}

fn C.GetTouchPointCount() int

@[inline]
pub fn get_touch_point_count() int {
	return C.GetTouchPointCount()
}

fn C.SetGesturesEnabled(flags u32)

@[inline]
pub fn set_gestures_enabled(flags u32) {
	C.SetGesturesEnabled(flags)
}

fn C.IsGestureDetected(gesture int) bool

@[inline]
pub fn is_gesture_detected(gesture int) bool {
	return C.IsGestureDetected(gesture)
}

fn C.GetGestureDetected() int

@[inline]
pub fn get_gesture_detected() int {
	return C.GetGestureDetected()
}

fn C.GetGestureHoldDuration() f32

@[inline]
pub fn get_gesture_hold_duration() f32 {
	return C.GetGestureHoldDuration()
}

fn C.GetGestureDragVector() Vector2

@[inline]
pub fn get_gesture_drag_vector() Vector2 {
	return C.GetGestureDragVector()
}

fn C.GetGestureDragAngle() f32

@[inline]
pub fn get_gesture_drag_angle() f32 {
	return C.GetGestureDragAngle()
}

fn C.GetGesturePinchVector() Vector2

@[inline]
pub fn get_gesture_pinch_vector() Vector2 {
	return C.GetGesturePinchVector()
}

fn C.GetGesturePinchAngle() f32

@[inline]
pub fn get_gesture_pinch_angle() f32 {
	return C.GetGesturePinchAngle()
}

fn C.UpdateCamera(camera &Camera, mode int)

@[inline]
pub fn update_camera(camera &Camera, mode int) {
	C.UpdateCamera(camera, mode)
}

fn C.UpdateCameraPro(camera &Camera, movement Vector3, rotation Vector3, zoom f32)

@[inline]
pub fn update_camera_pro(camera &Camera, movement Vector3, rotation Vector3, zoom f32) {
	C.UpdateCameraPro(camera, movement, rotation, zoom)
}

fn C.SetShapesTexture(texture Texture2D, source Rectangle)

@[inline]
pub fn set_shapes_texture(texture Texture2D, source Rectangle) {
	C.SetShapesTexture(texture, source)
}

fn C.DrawPixel(posx int, posy int, color Color)

@[inline]
pub fn draw_pixel(posx int, posy int, color Color) {
	C.DrawPixel(posx, posy, color)
}

fn C.DrawPixelV(position Vector2, color Color)

@[inline]
pub fn draw_pixel_v(position Vector2, color Color) {
	C.DrawPixelV(position, color)
}

fn C.DrawLine(startposx int, startposy int, endposx int, endposy int, color Color)

@[inline]
pub fn draw_line(startposx int, startposy int, endposx int, endposy int, color Color) {
	C.DrawLine(startposx, startposy, endposx, endposy, color)
}

fn C.DrawLineV(startpos Vector2, endpos Vector2, color Color)

@[inline]
pub fn draw_line_v(startpos Vector2, endpos Vector2, color Color) {
	C.DrawLineV(startpos, endpos, color)
}

fn C.DrawLineEx(startpos Vector2, endpos Vector2, thick f32, color Color)

@[inline]
pub fn draw_line_ex(startpos Vector2, endpos Vector2, thick f32, color Color) {
	C.DrawLineEx(startpos, endpos, thick, color)
}

fn C.DrawLineStrip(points &Vector2, pointcount int, color Color)

@[inline]
pub fn draw_line_strip(points []Vector2, color Color) {
	C.DrawLineStrip(points.data, points.len, color)
}

fn C.DrawLineBezier(startpos Vector2, endpos Vector2, thick f32, color Color)

@[inline]
pub fn draw_line_bezier(startpos Vector2, endpos Vector2, thick f32, color Color) {
	C.DrawLineBezier(startpos, endpos, thick, color)
}

fn C.DrawCircle(centerx int, centery int, radius f32, color Color)

@[inline]
pub fn draw_circle(centerx int, centery int, radius f32, color Color) {
	C.DrawCircle(centerx, centery, radius, color)
}

fn C.DrawCircleSector(center Vector2, radius f32, startangle f32, endangle f32, segments int, color Color)

@[inline]
pub fn draw_circle_sector(center Vector2, radius f32, startangle f32, endangle f32, segments int, color Color) {
	C.DrawCircleSector(center, radius, startangle, endangle, segments, color)
}

fn C.DrawCircleSectorLines(center Vector2, radius f32, startangle f32, endangle f32, segments int, color Color)

@[inline]
pub fn draw_circle_sector_lines(center Vector2, radius f32, startangle f32, endangle f32, segments int, color Color) {
	C.DrawCircleSectorLines(center, radius, startangle, endangle, segments, color)
}

fn C.DrawCircleGradient(centerx int, centery int, radius f32, color1 Color, color2 Color)

@[inline]
pub fn draw_circle_gradient(centerx int, centery int, radius f32, color1 Color, color2 Color) {
	C.DrawCircleGradient(centerx, centery, radius, color1, color2)
}

fn C.DrawCircleV(center Vector2, radius f32, color Color)

@[inline]
pub fn draw_circle_v(center Vector2, radius f32, color Color) {
	C.DrawCircleV(center, radius, color)
}

fn C.DrawCircleLines(centerx int, centery int, radius f32, color Color)

@[inline]
pub fn draw_circle_lines(centerx int, centery int, radius f32, color Color) {
	C.DrawCircleLines(centerx, centery, radius, color)
}

fn C.DrawCircleLinesV(center Vector2, radius f32, color Color)

@[inline]
pub fn draw_circle_lines_v(center Vector2, radius f32, color Color) {
	C.DrawCircleLinesV(center, radius, color)
}

fn C.DrawEllipse(centerx int, centery int, radiush f32, radiusv f32, color Color)

@[inline]
pub fn draw_ellipse(centerx int, centery int, radiush f32, radiusv f32, color Color) {
	C.DrawEllipse(centerx, centery, radiush, radiusv, color)
}

fn C.DrawEllipseLines(centerx int, centery int, radiush f32, radiusv f32, color Color)

@[inline]
pub fn draw_ellipse_lines(centerx int, centery int, radiush f32, radiusv f32, color Color) {
	C.DrawEllipseLines(centerx, centery, radiush, radiusv, color)
}

fn C.DrawRing(center Vector2, innerradius f32, outerradius f32, startangle f32, endangle f32, segments int, color Color)

@[inline]
pub fn draw_ring(center Vector2, innerradius f32, outerradius f32, startangle f32, endangle f32, segments int, color Color) {
	C.DrawRing(center, innerradius, outerradius, startangle, endangle, segments, color)
}

fn C.DrawRingLines(center Vector2, innerradius f32, outerradius f32, startangle f32, endangle f32, segments int, color Color)

@[inline]
pub fn draw_ring_lines(center Vector2, innerradius f32, outerradius f32, startangle f32, endangle f32, segments int, color Color) {
	C.DrawRingLines(center, innerradius, outerradius, startangle, endangle, segments, color)
}

fn C.DrawRectangle(posx int, posy int, width int, height int, color Color)

@[inline]
pub fn draw_rectangle(posx int, posy int, width int, height int, color Color) {
	C.DrawRectangle(posx, posy, width, height, color)
}

fn C.DrawRectangleV(position Vector2, size Vector2, color Color)

@[inline]
pub fn draw_rectangle_v(position Vector2, size Vector2, color Color) {
	C.DrawRectangleV(position, size, color)
}

fn C.DrawRectangleRec(rec Rectangle, color Color)

@[inline]
pub fn draw_rectangle_rec(rec Rectangle, color Color) {
	C.DrawRectangleRec(rec, color)
}

fn C.DrawRectanglePro(rec Rectangle, origin Vector2, rotation f32, color Color)

@[inline]
pub fn draw_rectangle_pro(rec Rectangle, origin Vector2, rotation f32, color Color) {
	C.DrawRectanglePro(rec, origin, rotation, color)
}

fn C.DrawRectangleGradientV(posx int, posy int, width int, height int, color1 Color, color2 Color)

@[inline]
pub fn draw_rectangle_gradient_v(posx int, posy int, width int, height int, color1 Color, color2 Color) {
	C.DrawRectangleGradientV(posx, posy, width, height, color1, color2)
}

fn C.DrawRectangleGradientH(posx int, posy int, width int, height int, color1 Color, color2 Color)

@[inline]
pub fn draw_rectangle_gradient_h(posx int, posy int, width int, height int, color1 Color, color2 Color) {
	C.DrawRectangleGradientH(posx, posy, width, height, color1, color2)
}

fn C.DrawRectangleGradientEx(rec Rectangle, col1 Color, col2 Color, col3 Color, col4 Color)

@[inline]
pub fn draw_rectangle_gradient_ex(rec Rectangle, col1 Color, col2 Color, col3 Color, col4 Color) {
	C.DrawRectangleGradientEx(rec, col1, col2, col3, col4)
}

fn C.DrawRectangleLines(posx int, posy int, width int, height int, color Color)

@[inline]
pub fn draw_rectangle_lines(posx int, posy int, width int, height int, color Color) {
	C.DrawRectangleLines(posx, posy, width, height, color)
}

fn C.DrawRectangleLinesEx(rec Rectangle, linethick f32, color Color)

@[inline]
pub fn draw_rectangle_lines_ex(rec Rectangle, linethick f32, color Color) {
	C.DrawRectangleLinesEx(rec, linethick, color)
}

fn C.DrawRectangleRounded(rec Rectangle, roundness f32, segments int, color Color)

@[inline]
pub fn draw_rectangle_rounded(rec Rectangle, roundness f32, segments int, color Color) {
	C.DrawRectangleRounded(rec, roundness, segments, color)
}

fn C.DrawRectangleRoundedLines(rec Rectangle, roundness f32, segments int, linethick f32, color Color)

@[inline]
pub fn draw_rectangle_rounded_lines(rec Rectangle, roundness f32, segments int, linethick f32, color Color) {
	C.DrawRectangleRoundedLines(rec, roundness, segments, linethick, color)
}

fn C.DrawTriangle(v1 Vector2, v2 Vector2, v3 Vector2, color Color)

@[inline]
pub fn draw_triangle(v1 Vector2, v2 Vector2, v3 Vector2, color Color) {
	C.DrawTriangle(v1, v2, v3, color)
}

fn C.DrawTriangleLines(v1 Vector2, v2 Vector2, v3 Vector2, color Color)

@[inline]
pub fn draw_triangle_lines(v1 Vector2, v2 Vector2, v3 Vector2, color Color) {
	C.DrawTriangleLines(v1, v2, v3, color)
}

fn C.DrawTriangleFan(points &Vector2, pointcount int, color Color)

@[inline]
pub fn draw_triangle_fan(points []Vector2, color Color) {
	C.DrawTriangleFan(points.data, points.len, color)
}

fn C.DrawTriangleStrip(points &Vector2, pointcount int, color Color)

@[inline]
pub fn draw_triangle_strip(points []Vector2, color Color) {
	C.DrawTriangleStrip(points.data, points.len, color)
}

fn C.DrawPoly(center Vector2, sides int, radius f32, rotation f32, color Color)

@[inline]
pub fn draw_poly(center Vector2, sides int, radius f32, rotation f32, color Color) {
	C.DrawPoly(center, sides, radius, rotation, color)
}

fn C.DrawPolyLines(center Vector2, sides int, radius f32, rotation f32, color Color)

@[inline]
pub fn draw_poly_lines(center Vector2, sides int, radius f32, rotation f32, color Color) {
	C.DrawPolyLines(center, sides, radius, rotation, color)
}

fn C.DrawPolyLinesEx(center Vector2, sides int, radius f32, rotation f32, linethick f32, color Color)

@[inline]
pub fn draw_poly_lines_ex(center Vector2, sides int, radius f32, rotation f32, linethick f32, color Color) {
	C.DrawPolyLinesEx(center, sides, radius, rotation, linethick, color)
}

fn C.DrawSplineLinear(points &Vector2, pointcount int, thick f32, color Color)

@[inline]
pub fn draw_spline_linear(points []Vector2, thick f32, color Color) {
	C.DrawSplineLinear(points.data, points.len, thick, color)
}

fn C.DrawSplineBasis(points &Vector2, pointcount int, thick f32, color Color)

@[inline]
pub fn draw_spline_basis(points []Vector2, thick f32, color Color) {
	C.DrawSplineBasis(points.data, points.len, thick, color)
}

fn C.DrawSplineCatmullRom(points &Vector2, pointcount int, thick f32, color Color)

@[inline]
pub fn draw_spline_catmull_rom(points []Vector2, thick f32, color Color) {
	C.DrawSplineCatmullRom(points.data, points.len, thick, color)
}

fn C.DrawSplineBezierQuadratic(points &Vector2, pointcount int, thick f32, color Color)

@[inline]
pub fn draw_spline_bezier_quadratic(points []Vector2, thick f32, color Color) {
	C.DrawSplineBezierQuadratic(points.data, points.len, thick, color)
}

fn C.DrawSplineBezierCubic(points &Vector2, pointcount int, thick f32, color Color)

@[inline]
pub fn draw_spline_bezier_cubic(points []Vector2, thick f32, color Color) {
	C.DrawSplineBezierCubic(points.data, points.len, thick, color)
}

fn C.DrawSplineSegmentLinear(p1 Vector2, p2 Vector2, thick f32, color Color)

@[inline]
pub fn draw_spline_segment_linear(p1 Vector2, p2 Vector2, thick f32, color Color) {
	C.DrawSplineSegmentLinear(p1, p2, thick, color)
}

fn C.DrawSplineSegmentBasis(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, thick f32, color Color)

@[inline]
pub fn draw_spline_segment_basis(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, thick f32, color Color) {
	C.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color)
}

fn C.DrawSplineSegmentCatmullRom(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, thick f32, color Color)

@[inline]
pub fn draw_spline_segment_catmull_rom(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, thick f32, color Color) {
	C.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color)
}

fn C.DrawSplineSegmentBezierQuadratic(p1 Vector2, c2 Vector2, p3 Vector2, thick f32, color Color)

@[inline]
pub fn draw_spline_segment_bezier_quadratic(p1 Vector2, c2 Vector2, p3 Vector2, thick f32, color Color) {
	C.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color)
}

fn C.DrawSplineSegmentBezierCubic(p1 Vector2, c2 Vector2, c3 Vector2, p4 Vector2, thick f32, color Color)

@[inline]
pub fn draw_spline_segment_bezier_cubic(p1 Vector2, c2 Vector2, c3 Vector2, p4 Vector2, thick f32, color Color) {
	C.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color)
}

fn C.GetSplinePointLinear(startpos Vector2, endpos Vector2, t f32) Vector2

@[inline]
pub fn get_spline_point_linear(startpos Vector2, endpos Vector2, t f32) Vector2 {
	return C.GetSplinePointLinear(startpos, endpos, t)
}

fn C.GetSplinePointBasis(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, t f32) Vector2

@[inline]
pub fn get_spline_point_basis(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, t f32) Vector2 {
	return C.GetSplinePointBasis(p1, p2, p3, p4, t)
}

fn C.GetSplinePointCatmullRom(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, t f32) Vector2

@[inline]
pub fn get_spline_point_catmull_rom(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, t f32) Vector2 {
	return C.GetSplinePointCatmullRom(p1, p2, p3, p4, t)
}

fn C.GetSplinePointBezierQuad(p1 Vector2, c2 Vector2, p3 Vector2, t f32) Vector2

@[inline]
pub fn get_spline_point_bezier_quad(p1 Vector2, c2 Vector2, p3 Vector2, t f32) Vector2 {
	return C.GetSplinePointBezierQuad(p1, c2, p3, t)
}

fn C.GetSplinePointBezierCubic(p1 Vector2, c2 Vector2, c3 Vector2, p4 Vector2, t f32) Vector2

@[inline]
pub fn get_spline_point_bezier_cubic(p1 Vector2, c2 Vector2, c3 Vector2, p4 Vector2, t f32) Vector2 {
	return C.GetSplinePointBezierCubic(p1, c2, c3, p4, t)
}

fn C.GetCollisionRec(rec1 Rectangle, rec2 Rectangle) Rectangle

@[inline]
pub fn get_collision_rec(rec1 Rectangle, rec2 Rectangle) Rectangle {
	return C.GetCollisionRec(rec1, rec2)
}

fn C.LoadImage(filename &u8) Image

@[inline]
pub fn load_image(filename string) Image {
	return C.LoadImage(filename.str)
}

fn C.LoadImageRaw(filename &i8, width int, height int, format int, headersize int) Image

@[inline]
pub fn load_image_raw(filename string, width int, height int, format int, headersize int) Image {
	return C.LoadImageRaw(filename.str, width, height, format, headersize)
}

fn C.LoadImageSvg(filenameorstring &i8, width int, height int) Image

@[inline]
pub fn load_image_svg(filenameorstring string, width int, height int) Image {
	return C.LoadImageSvg(filenameorstring.str, width, height)
}

fn C.LoadImageAnim(filename &i8, frames &int) Image

@[inline]
pub fn load_image_anim(filename string, frames &int) Image {
	return C.LoadImageAnim(filename.str, frames)
}

fn C.LoadImageFromMemory(filetype &i8, filedata &u8, datasize int) Image

@[inline]
pub fn load_image_from_memory(filetype string, filedata &u8, datasize int) Image {
	return C.LoadImageFromMemory(filetype.str, filedata, datasize)
}

fn C.LoadImageFromTexture(texture Texture2D) Image

@[inline]
pub fn load_image_from_texture(texture Texture2D) Image {
	return C.LoadImageFromTexture(texture)
}

fn C.LoadImageFromScreen() Image

@[inline]
pub fn load_image_from_screen() Image {
	return C.LoadImageFromScreen()
}

fn C.UnloadImage(image Image)

@[inline]
pub fn unload_image(image Image) {
	C.UnloadImage(image)
}

fn C.ExportImage(image Image, filename &u8) bool

@[inline]
pub fn export_image(image Image, filename string) bool {
	return C.ExportImage(image, filename.str)
}


// TODO: Return []u8 instead of &u8
fn C.ExportImageToMemory(image Image, filetype &u8, filesize &int) &u8

@[inline]
pub fn export_image_to_memory(image Image, filetype string) (&u8, int) {
	size := 0
	data := C.ExportImageToMemory(image, filetype.str, &size)

	return data, size
}

fn C.GenImageColor(width int, height int, color Color) Image

@[inline]
pub fn gen_image_color(width int, height int, color Color) Image {
	return C.GenImageColor(width, height, color)
}

fn C.GenImageGradientLinear(width int, height int, direction int, start Color, end Color) Image

@[inline]
pub fn gen_image_gradient_linear(width int, height int, direction int, start Color, end Color) Image {
	return C.GenImageGradientLinear(width, height, direction, start, end)
}

fn C.GenImageGradientRadial(width int, height int, density f32, inner Color, outer Color) Image

@[inline]
pub fn gen_image_gradient_radial(width int, height int, density f32, inner Color, outer Color) Image {
	return C.GenImageGradientRadial(width, height, density, inner, outer)
}

fn C.GenImageGradientSquare(width int, height int, density f32, inner Color, outer Color) Image

@[inline]
pub fn gen_image_gradient_square(width int, height int, density f32, inner Color, outer Color) Image {
	return C.GenImageGradientSquare(width, height, density, inner, outer)
}

fn C.GenImageChecked(width int, height int, checksx int, checksy int, col1 Color, col2 Color) Image

@[inline]
pub fn gen_image_checked(width int, height int, checksx int, checksy int, col1 Color, col2 Color) Image {
	return C.GenImageChecked(width, height, checksx, checksy, col1, col2)
}

fn C.GenImageWhiteNoise(width int, height int, factor f32) Image

@[inline]
pub fn gen_image_white_noise(width int, height int, factor f32) Image {
	return C.GenImageWhiteNoise(width, height, factor)
}

fn C.GenImagePerlinNoise(width int, height int, offsetx int, offsety int, scale f32) Image

@[inline]
pub fn gen_image_perlin_noise(width int, height int, offsetx int, offsety int, scale f32) Image {
	return C.GenImagePerlinNoise(width, height, offsetx, offsety, scale)
}

fn C.GenImageCellular(width int, height int, tilesize int) Image

@[inline]
pub fn gen_image_cellular(width int, height int, tilesize int) Image {
	return C.GenImageCellular(width, height, tilesize)
}

fn C.GenImageText(width int, height int, text &i8) Image

@[inline]
pub fn gen_image_text(width int, height int, text string) Image {
	return C.GenImageText(width, height, text.str)
}

fn C.ImageCopy(image Image) Image

fn C.ImageFromImage(image Image, rec Rectangle) Image

fn C.ImageText(text &i8, fontsize int, color Color) Image

fn C.ImageTextEx(font Font, text &i8, fontsize f32, spacing f32, tint Color) Image

fn C.ImageFormat(image &Image, newformat int)

fn C.ImageToPOT(image &Image, fill Color)

fn C.ImageCrop(image &Image, crop Rectangle)

fn C.ImageAlphaCrop(image &Image, threshold f32)

fn C.ImageAlphaClear(image &Image, color Color, threshold f32)

fn C.ImageAlphaMask(image &Image, alphamask Image)

fn C.ImageAlphaPremultiply(image &Image)

fn C.ImageBlurGaussian(image &Image, blursize int)

fn C.ImageKernelConvolution(image &Image, kernel &f32, kernelsize int)

fn C.ImageResize(image &Image, newwidth int, newheight int)

fn C.ImageResizeNN(image &Image, newwidth int, newheight int)

fn C.ImageResizeCanvas(image &Image, newwidth int, newheight int, offsetx int, offsety int, fill Color)

fn C.ImageMipmaps(image &Image)

fn C.ImageDither(image &Image, rbpp int, gbpp int, bbpp int, abpp int)

fn C.ImageFlipVertical(image &Image)

fn C.ImageFlipHorizontal(image &Image)

fn C.ImageRotate(image &Image, degrees int)

fn C.ImageRotateCW(image &Image)

fn C.ImageRotateCCW(image &Image)

fn C.ImageColorTint(image &Image, color Color)

fn C.ImageColorInvert(image &Image)

fn C.ImageColorGrayscale(image &Image)

fn C.ImageColorContrast(image &Image, contrast f32)

fn C.ImageColorBrightness(image &Image, brightness int)

fn C.ImageColorReplace(image &Image, color Color, replace Color)

fn C.LoadImageColors(image Image) &Color

fn C.LoadImagePalette(image Image, maxpalettesize int, colorcount &int) &Color

fn C.UnloadImageColors(colors &Color)

fn C.UnloadImagePalette(colors &Color)

fn C.GetImageAlphaBorder(image Image, threshold f32) Rectangle

fn C.GetImageColor(image Image, x int, y int) Color

fn C.ImageClearBackground(dst &Image, color Color)

fn C.ImageDrawPixel(dst &Image, posx int, posy int, color Color)

fn C.ImageDrawPixelV(dst &Image, position Vector2, color Color)

fn C.ImageDrawLine(dst &Image, startposx int, startposy int, endposx int, endposy int, color Color)

fn C.ImageDrawLineV(dst &Image, start Vector2, end Vector2, color Color)

fn C.ImageDrawCircle(dst &Image, centerx int, centery int, radius int, color Color)

fn C.ImageDrawCircleV(dst &Image, center Vector2, radius int, color Color)

fn C.ImageDrawCircleLines(dst &Image, centerx int, centery int, radius int, color Color)

fn C.ImageDrawCircleLinesV(dst &Image, center Vector2, radius int, color Color)

fn C.ImageDrawRectangle(dst &Image, posx int, posy int, width int, height int, color Color)

fn C.ImageDrawRectangleV(dst &Image, position Vector2, size Vector2, color Color)

fn C.ImageDrawRectangleRec(dst &Image, rec Rectangle, color Color)

fn C.ImageDrawRectangleLines(dst &Image, rec Rectangle, thick int, color Color)

fn C.ImageDraw(dst &Image, src Image, srcrec Rectangle, dstrec Rectangle, tint Color)

fn C.ImageDrawText(dst &Image, text &i8, posx int, posy int, fontsize int, color Color)

fn C.ImageDrawTextEx(dst &Image, font Font, text &i8, position Vector2, fontsize f32, spacing f32, tint Color)

fn C.LoadTexture(filename &i8) Texture2D

fn C.LoadTextureFromImage(image Image) Texture2D

fn C.LoadTextureCubemap(image Image, layout int) TextureCubemap

fn C.LoadRenderTexture(width int, height int) RenderTexture2D

fn C.UnloadTexture(texture Texture2D)

fn C.UnloadRenderTexture(target RenderTexture2D)

fn C.UpdateTexture(texture Texture2D, pixels voidptr)

fn C.UpdateTextureRec(texture Texture2D, rec Rectangle, pixels voidptr)

fn C.GenTextureMipmaps(texture &Texture2D)

fn C.SetTextureFilter(texture Texture2D, filter int)

fn C.SetTextureWrap(texture Texture2D, wrap int)

fn C.DrawTexture(texture Texture2D, posx int, posy int, tint Color)

fn C.DrawTextureV(texture Texture2D, position Vector2, tint Color)

fn C.DrawTextureEx(texture Texture2D, position Vector2, rotation f32, scale f32, tint Color)

fn C.DrawTextureRec(texture Texture2D, source Rectangle, position Vector2, tint Color)

fn C.DrawTexturePro(texture Texture2D, source Rectangle, dest Rectangle, origin Vector2, rotation f32, tint Color)

fn C.DrawTextureNPatch(texture Texture2D, npatchinfo NPatchInfo, dest Rectangle, origin Vector2, rotation f32, tint Color)

fn C.Fade(color Color, alpha f32) Color

fn C.ColorToInt(color Color) int

fn C.ColorNormalize(color Color) Vector4

fn C.ColorFromNormalized(normalized Vector4) Color

fn C.ColorToHSV(color Color) Vector3

fn C.ColorFromHSV(hue f32, saturation f32, value f32) Color

fn C.ColorTint(color Color, tint Color) Color

fn C.ColorBrightness(color Color, factor f32) Color

fn C.ColorContrast(color Color, contrast f32) Color

fn C.ColorAlpha(color Color, alpha f32) Color

fn C.ColorAlphaBlend(dst Color, src Color, tint Color) Color

fn C.GetColor(hexvalue u32) Color

fn C.GetPixelColor(srcptr voidptr, format int) Color

fn C.SetPixelColor(dstptr voidptr, color Color, format int)

fn C.GetPixelDataSize(width int, height int, format int) int

fn C.GetFontDefault() Font

fn C.LoadFont(filename &i8) Font

fn C.LoadFontEx(filename &i8, fontsize int, codepoints &int, codepointcount int) Font

fn C.LoadFontFromImage(image Image, key Color, firstchar int) Font

fn C.LoadFontFromMemory(filetype &i8, filedata &u8, datasize int, fontsize int, codepoints &int, codepointcount int) Font

fn C.LoadFontData(filedata &u8, datasize int, fontsize int, codepoints &int, codepointcount int, type_ int) &GlyphInfo

fn C.GenImageFontAtlas(glyphs &GlyphInfo, glyphrecs &&Rectangle, glyphcount int, fontsize int, padding int, packmethod int) Image

fn C.UnloadFontData(glyphs &GlyphInfo, glyphcount int)

fn C.UnloadFont(font Font)

fn C.DrawFPS(posx int, posy int)

fn C.DrawText(text &i8, posx int, posy int, fontsize int, color Color)

@[inline]
pub fn draw_text(text string, posx int, posy int, fontsize int, color Color) {
	C.DrawText(text.str, posx, posy, fontsize, color)
}

fn C.DrawTextEx(font Font, text &i8, position Vector2, fontsize f32, spacing f32, tint Color)

@[inline]
pub fn draw_text_ex(font Font, text string, position Vector2, fontsize f32, spacing f32, tint Color) {
	C.DrawTextEx(font, text.str, position, fontsize, spacing, tint)
}

fn C.DrawTextPro(font Font, text &i8, position Vector2, origin Vector2, rotation f32, fontsize f32, spacing f32, tint Color)

fn C.DrawTextCodepoint(font Font, codepoint int, position Vector2, fontsize f32, tint Color)

fn C.DrawTextCodepoints(font Font, codepoints &int, codepointcount int, position Vector2, fontsize f32, spacing f32, tint Color)

fn C.SetTextLineSpacing(spacing int)

fn C.MeasureText(text &i8, fontsize int) int

fn C.MeasureTextEx(font Font, text &i8, fontsize f32, spacing f32) Vector2

fn C.GetGlyphIndex(font Font, codepoint int) int

fn C.GetGlyphInfo(font Font, codepoint int) GlyphInfo

fn C.GetGlyphAtlasRec(font Font, codepoint int) Rectangle

fn C.LoadUTF8(codepoints &int, length int) &i8

fn C.UnloadUTF8(text &i8)

fn C.LoadCodepoints(text &i8, count &int) &int

fn C.UnloadCodepoints(codepoints &int)

fn C.GetCodepointCount(text &i8) int

fn C.GetCodepoint(text &i8, codepointsize &int) int

fn C.GetCodepointNext(text &i8, codepointsize &int) int

fn C.GetCodepointPrevious(text &i8, codepointsize &int) int

fn C.CodepointToUTF8(codepoint int, utf8size &int) &i8

fn C.TextCopy(dst &i8, src &i8) int

fn C.TextLength(text &i8) u32

fn C.TextFormat(text ...&i8) &i8

fn C.TextSubtext(text &i8, position int, length int) &i8

fn C.TextReplace(text &i8, replace &i8, by &i8) &i8

fn C.TextInsert(text &i8, insert &i8, position int) &i8

fn C.TextJoin(textlist &&u8, count int, delimiter &i8) &i8

fn C.TextSplit(text &i8, delimiter i8, count &int) &&u8

fn C.TextAppend(text &i8, append &i8, position &int)

fn C.TextFindIndex(text &i8, find &i8) int

fn C.TextToUpper(text &i8) &i8

fn C.TextToLower(text &i8) &i8

fn C.TextToPascal(text &i8) &i8

fn C.TextToInteger(text &i8) int

fn C.TextToFloat(text &i8) f32

fn C.DrawLine3D(startpos Vector3, endpos Vector3, color Color)

fn C.DrawPoint3D(position Vector3, color Color)

fn C.DrawCircle3D(center Vector3, radius f32, rotationaxis Vector3, rotationangle f32, color Color)

fn C.DrawTriangle3D(v1 Vector3, v2 Vector3, v3 Vector3, color Color)

fn C.DrawTriangleStrip3D(points &Vector3, pointcount int, color Color)

fn C.DrawCube(position Vector3, width f32, height f32, length f32, color Color)

fn C.DrawCubeV(position Vector3, size Vector3, color Color)

fn C.DrawCubeWires(position Vector3, width f32, height f32, length f32, color Color)

fn C.DrawCubeWiresV(position Vector3, size Vector3, color Color)

fn C.DrawSphere(centerpos Vector3, radius f32, color Color)

fn C.DrawSphereEx(centerpos Vector3, radius f32, rings int, slices int, color Color)

fn C.DrawSphereWires(centerpos Vector3, radius f32, rings int, slices int, color Color)

fn C.DrawCylinder(position Vector3, radiustop f32, radiusbottom f32, height f32, slices int, color Color)

fn C.DrawCylinderEx(startpos Vector3, endpos Vector3, startradius f32, endradius f32, sides int, color Color)

fn C.DrawCylinderWires(position Vector3, radiustop f32, radiusbottom f32, height f32, slices int, color Color)

fn C.DrawCylinderWiresEx(startpos Vector3, endpos Vector3, startradius f32, endradius f32, sides int, color Color)

fn C.DrawCapsule(startpos Vector3, endpos Vector3, radius f32, slices int, rings int, color Color)

fn C.DrawCapsuleWires(startpos Vector3, endpos Vector3, radius f32, slices int, rings int, color Color)

fn C.DrawPlane(centerpos Vector3, size Vector2, color Color)

fn C.DrawRay(ray Ray, color Color)

fn C.DrawGrid(slices int, spacing f32)

fn C.LoadModel(filename &i8) Model

fn C.LoadModelFromMesh(mesh Mesh) Model

fn C.UnloadModel(model Model)

fn C.GetModelBoundingBox(model Model) BoundingBox

fn C.DrawModel(model Model, position Vector3, scale f32, tint Color)

fn C.DrawModelEx(model Model, position Vector3, rotationaxis Vector3, rotationangle f32, scale Vector3, tint Color)

fn C.DrawModelWires(model Model, position Vector3, scale f32, tint Color)

fn C.DrawModelWiresEx(model Model, position Vector3, rotationaxis Vector3, rotationangle f32, scale Vector3, tint Color)

fn C.DrawBoundingBox(box BoundingBox, color Color)

fn C.DrawBillboard(camera Camera, texture Texture2D, position Vector3, size f32, tint Color)

fn C.DrawBillboardRec(camera Camera, texture Texture2D, source Rectangle, position Vector3, size Vector2, tint Color)

fn C.DrawBillboardPro(camera Camera, texture Texture2D, source Rectangle, position Vector3, up Vector3, size Vector2, origin Vector2, rotation f32, tint Color)

fn C.UploadMesh(mesh &Mesh, dynamic bool)

fn C.UpdateMeshBuffer(mesh Mesh, index int, data voidptr, datasize int, offset int)

fn C.UnloadMesh(mesh Mesh)

fn C.DrawMesh(mesh Mesh, material Material, transform Matrix)

fn C.DrawMeshInstanced(mesh Mesh, material Material, transforms &Matrix, instances int)

fn C.GetMeshBoundingBox(mesh Mesh) BoundingBox

fn C.GenMeshTangents(mesh &Mesh)

fn C.GenMeshPoly(sides int, radius f32) Mesh

fn C.GenMeshPlane(width f32, length f32, resx int, resz int) Mesh

fn C.GenMeshCube(width f32, height f32, length f32) Mesh

fn C.GenMeshSphere(radius f32, rings int, slices int) Mesh

fn C.GenMeshHemiSphere(radius f32, rings int, slices int) Mesh

fn C.GenMeshCylinder(radius f32, height f32, slices int) Mesh

fn C.GenMeshCone(radius f32, height f32, slices int) Mesh

fn C.GenMeshTorus(radius f32, size f32, radseg int, sides int) Mesh

fn C.GenMeshKnot(radius f32, size f32, radseg int, sides int) Mesh

fn C.GenMeshHeightmap(heightmap Image, size Vector3) Mesh

fn C.GenMeshCubicmap(cubicmap Image, cubesize Vector3) Mesh

fn C.LoadMaterials(filename &i8, materialcount &int) &Material

fn C.LoadMaterialDefault() Material

fn C.UnloadMaterial(material Material)

fn C.SetMaterialTexture(material &Material, maptype int, texture Texture2D)

fn C.SetModelMeshMaterial(model &Model, meshid int, materialid int)

fn C.LoadModelAnimations(filename &i8, animcount &int) &ModelAnimation

fn C.UpdateModelAnimation(model Model, anim ModelAnimation, frame int)

fn C.UnloadModelAnimation(anim ModelAnimation)

fn C.UnloadModelAnimations(animations &ModelAnimation, animcount int)

fn C.GetRayCollisionSphere(ray Ray, center Vector3, radius f32) RayCollision

fn C.GetRayCollisionBox(ray Ray, box BoundingBox) RayCollision

fn C.GetRayCollisionMesh(ray Ray, mesh Mesh, transform Matrix) RayCollision

fn C.GetRayCollisionTriangle(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3) RayCollision

fn C.GetRayCollisionQuad(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3, p4 Vector3) RayCollision

fn C.InitAudioDevice()

fn C.CloseAudioDevice()

fn C.SetMasterVolume(volume f32)

fn C.GetMasterVolume() f32

fn C.LoadWave(filename &i8) Wave

fn C.LoadWaveFromMemory(filetype &i8, filedata &u8, datasize int) Wave

fn C.LoadSound(filename &i8) Sound

fn C.LoadSoundFromWave(wave Wave) Sound

fn C.LoadSoundAlias(source Sound) Sound

fn C.UpdateSound(sound Sound, data voidptr, samplecount int)

fn C.UnloadWave(wave Wave)

fn C.UnloadSound(sound Sound)

fn C.UnloadSoundAlias(alias Sound)

fn C.PlaySound(sound Sound)

fn C.StopSound(sound Sound)

fn C.PauseSound(sound Sound)

fn C.ResumeSound(sound Sound)

fn C.SetSoundVolume(sound Sound, volume f32)

fn C.SetSoundPitch(sound Sound, pitch f32)

fn C.SetSoundPan(sound Sound, pan f32)

fn C.WaveCopy(wave Wave) Wave

fn C.WaveCrop(wave &Wave, initsample int, finalsample int)

fn C.WaveFormat(wave &Wave, samplerate int, samplesize int, channels int)

fn C.LoadWaveSamples(wave Wave) &f32

fn C.UnloadWaveSamples(samples &f32)

fn C.LoadMusicStream(filename &i8) Music

fn C.LoadMusicStreamFromMemory(filetype &i8, data &u8, datasize int) Music

fn C.UnloadMusicStream(music Music)

fn C.PlayMusicStream(music Music)

fn C.UpdateMusicStream(music Music)

fn C.StopMusicStream(music Music)

fn C.PauseMusicStream(music Music)

fn C.ResumeMusicStream(music Music)

fn C.SeekMusicStream(music Music, position f32)

fn C.SetMusicVolume(music Music, volume f32)

fn C.SetMusicPitch(music Music, pitch f32)

fn C.SetMusicPan(music Music, pan f32)

fn C.GetMusicTimeLength(music Music) f32

fn C.GetMusicTimePlayed(music Music) f32

fn C.LoadAudioStream(samplerate u32, samplesize u32, channels u32) AudioStream

fn C.UnloadAudioStream(stream AudioStream)

fn C.UpdateAudioStream(stream AudioStream, data voidptr, framecount int)

fn C.PlayAudioStream(stream AudioStream)

fn C.PauseAudioStream(stream AudioStream)

fn C.ResumeAudioStream(stream AudioStream)

fn C.StopAudioStream(stream AudioStream)

fn C.SetAudioStreamVolume(stream AudioStream, volume f32)

fn C.SetAudioStreamPitch(stream AudioStream, pitch f32)

fn C.SetAudioStreamPan(stream AudioStream, pan f32)

fn C.SetAudioStreamBufferSizeDefault(size int)

fn C.SetAudioStreamCallback(stream AudioStream, callback AudioCallback)

fn C.AttachAudioStreamProcessor(stream AudioStream, processor AudioCallback)

fn C.DetachAudioStreamProcessor(stream AudioStream, processor AudioCallback)

fn C.AttachAudioMixedProcessor(processor AudioCallback)

fn C.DetachAudioMixedProcessor(processor AudioCallback)
