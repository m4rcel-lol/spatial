#include <metal_stdlib>
using namespace metal;

vertex float4 edgeVertex(uint vid [[vertex_id]]) {
    return float4(0, 0, 0, 1);
}
