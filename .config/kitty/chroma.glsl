uniform sampler2D tex;
uniform vec2 window_size;
in vec2 uv;
out vec4 frag_color;

void main() {
    vec2 offset = vec2(1.0) / window_size;
    float r = texture(tex, uv + offset).r;
    float g = texture(tex, uv).g;
    float b = texture(tex, uv - offset).b;
    frag_color = vec4(r, g, b, 1.0);
}

