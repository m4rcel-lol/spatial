#include <metal_stdlib>
using namespace metal;

kernel void barnesHutStep(device float2 *positions [[buffer(0)]], uint id [[thread_position_in_grid]]) {
    positions[id] += float2(0.0);
}
