//
// Generated by Microsoft (R) HLSL Shader Compiler 9.30.9200.20499
//
///
// Parameters:
//
//   bool g_bAddSpecular;
//   bool g_bDisplayShadows;
//   bool g_bVisualizeLOD;
//   bool g_bVisualizeMipLevel;
//   float g_fHeightMapScale;
//   float g_fShadowSoftening;
//   float g_fSpecularExponent;
//   float4 g_materialAmbientColor;
//   float4 g_materialDiffuseColor;
//   float4 g_materialSpecularColor;
//   int g_nLODThreshold;
//   int g_nMaxSamples;
//   int g_nMinSamples;
//   float2 g_vTextureDims;
//   sampler2D tBase;
//   sampler2D tNormalHeightMap;
//
//
// Registers:
//
//   Name                    Reg   Size
//   ----------------------- ----- ----
//   g_materialAmbientColor  c0       1
//   g_materialDiffuseColor  c1       1
//   g_materialSpecularColor c2       1
//   g_fSpecularExponent     c3       1
//   g_bAddSpecular          c4       1
//   g_fHeightMapScale       c5       1
//   g_bVisualizeLOD         c6       1
//   g_bVisualizeMipLevel    c7       1
//   g_bDisplayShadows       c8       1
//   g_vTextureDims          c9       1
//   g_nLODThreshold         c10      1
//   g_fShadowSoftening      c11      1
//   g_nMinSamples           c12      1
//   g_nMaxSamples           c13      1
//   tBase                   s0       1
//   tNormalHeightMap        s1       1
//

    ps_3_0
    def c14, 2, -1, 0, 0
    def c15, 0.879999995, 0.769999981, -0.879999995, -0.769999981
    def c16, 0.660000026, 0.550000012, -0.660000026, 4
    def c17, 6, 0.439999998, 0.330000013, -0.439999998
    def c18, 8, 10, 0.219999999, -0.219999999
    def c19, 12, 0.600000024, 0.400000006, 3
    def c20, 0.5, 0, 1, 0
    defi i0, 255, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord2 v2.xyz
    dcl_texcoord3 v3.xy
    dcl_texcoord4 v4.xyz
    dcl_texcoord5 v5.xyz
    dcl_2d s0
    dcl_2d s1
    nrm r0.xyz, v2
    nrm r1.xyz, v1
    mul r2.xy, c9, v0
    dsx r2.zw, r2.xyxy
    dsy r2.xy, r2
    mul r2.xy, r2, r2
    mad r2.xy, r2.zwzw, r2.zwzw, r2
    max r0.w, r2.x, r2.y
    log r0.w, r0.w
    mul r0.w, r0.w, c20.x
    max r2.x, r0.w, c20.y
    add r0.w, -r2.x, c10.x
    if_ge c10.x, r2.x
      dsx r2.yz, v0.xxyw
      dsy r3.xy, v0
      nrm r4.xyz, v5
      nrm r5.xyz, v4
      dp3 r2.w, r4, r5
      mov r4.x, c13.x
      add r3.z, -r4.x, c12.x
      mul r3.w, r2.w, r3.z
      mad r2.w, r2.w, r3.z, c13.x
      frc r3.z, r3.w
      add r3.w, r2.w, -r3.z
      cmp r3.z, -r3.z, c20.y, c20.z
      cmp r2.w, r2.w, c20.y, r3.z
      add r2.w, r2.w, r3.w
      rcp r3.z, r2.w
      add r3.w, r2.w, c20.z
      mov r4.xy, v0
      mov r4.z, c20.y
      mov r5.zw, c20.z
      mov r6, c20.y
      rep i0
        mov r4.w, r2.w
        break_ge r4.z, r4.w
        mad r4.xy, r3.z, -v3, r4
        texldd r7, r4, s1, r2.yzzw, r3
        add r5.x, -r3.z, r5.z
        add r4.w, -r7.w, r5.x
        add r7.x, r4.z, c20.z
        cmp r4.z, r4.w, r7.x, r3.w
        mov r5.y, r7.w
        cmp r6, r4.w, r6, r5
        mov r5.w, r7.w
        mov r5.z, r5.x
      endrep
      add r2.w, -r6.w, r6.z
      add r3.z, -r6.y, r6.x
      add r3.w, r2.w, -r3.z
      mul r3.z, r3.z, r6.z
      mad r2.w, r6.x, r2.w, -r3.z
      rcp r3.z, r3.w
      mad r2.w, r2.w, -r3.z, c20.z
      cmp r2.w, -r3_abs.w, c20.z, r2.w
      mov r4.xy, v0
      mad r3.zw, v3.xyxy, -r2.w, r4.xyxy
      add r0.w, r0.w, -c20.z
      frc r2.w, r2.x
      add r2.w, r2.x, -r2.w
      add r2.w, -r2.w, r2.x
      add r4.x, r2.w, r2.w
      max r5.x, c20.z, r4.x
      mov r4.yz, c20
      cmp r4.x, -c6.x, r4.z, r5.x
      lrp r5.xy, r2.w, v0, r3.zwzw
      cmp r6.x, r0.w, c20.z, r4.x
      cmp r4.xw, r0.w, r3.zyzw, r5.xyzy
      add r0.w, -r4.z, c8.x
      if_ne -r0.w, r0.w
        mov r0.w, c20.z
      else
        mul r5.xy, r1, c5.x
        texldd r7, r3.zwzw, s1, r2.yzzw, r3
        mad r8, r5.xyxy, c15.xxyy, r3.zwzw
        texldd r9, r8, s1, r2.yzzw, r3
        add r2.w, -r7.w, r9.w
        add r2.w, r2.w, c15.z
        texldd r8, r8.zwzw, s1, r2.yzzw, r3
        add r4.z, -r7.w, r8.w
        add r4.z, r4.z, c15.w
        dp2add r4.y, r4.z, c11.x, r4.y
        mad r8, r5.xyxy, c16.xxyy, r3.zwzw
        texldd r9, r8, s1, r2.yzzw, r3
        add r4.z, -r7.w, r9.w
        add r4.z, r4.z, c16.z
        mul r4.z, r4.z, c11.x
        mul r4.z, r4.z, c16.w
        texldd r8, r8.zwzw, s1, r2.yzzw, r3
        add r5.z, -r7.w, r8.w
        add r5.z, r5.z, -c16.y
        mul r5.z, r5.z, c11.x
        mul r5.z, r5.z, c17.x
        mad r8, r5.xyxy, c17.yyzz, r3.zwzw
        texldd r9, r8, s1, r2.yzzw, r3
        add r5.w, -r7.w, r9.w
        add r5.w, r5.w, c17.w
        mul r5.w, r5.w, c11.x
        mul r5.w, r5.w, c18.x
        texldd r8, r8.zwzw, s1, r2.yzzw, r3
        add r6.z, -r7.w, r8.w
        add r6.z, r6.z, -c17.z
        mul r6.z, r6.z, c11.x
        mul r6.z, r6.z, c18.y
        mad r3.zw, r5.xyxy, c18.z, r3
        texldd r3, r3.zwzw, s1, r2.yzzw, r3
        add r2.y, -r7.w, r3.w
        add r2.y, r2.y, c18.w
        mul r2.yw, r2, c11.x
        mul r2.y, r2.y, c19.x
        max r3.x, r2.w, r4.y
        max r2.z, r3.x, r4.z
        max r3.x, r2.z, r5.z
        max r2.z, r3.x, r5.w
        max r3.x, r2.z, r6.z
        max r4.y, r3.x, r2.y
        add r2.y, -r4.y, c20.z
        mad r0.w, r2.y, c19.y, c19.z
      endif
    else
      mov r6.x, c19.w
      mov r4.xw, v0.xyzy
      mov r0.w, c20.z
    endif
    texld r3, r4.xwzw, s1
    mad r3, r3, c14.x, c14.y
    dp4 r2.y, r3, r3
    rsq r2.y, r2.y
    mul r2.yzw, r2.y, r3.xxyz
    texld r3, r4.xwzw, s0
    mov r1.w, -r1.y
    dp3_sat r1.y, r2.ywzw, r1.xzww
    dp3 r4.x, r0, r2.yzww
    add r4.x, r4.x, r4.x
    mad r0.xyz, r4.x, r2.yzww, -r0
    nrm r4.xyz, r0
    dp3_sat r0.x, r4.xzyw, r1.xzww
    pow_sat r1.x, r0.x, c3.x
    mul r4, r1.x, c2
    mov r0.y, c20.y
    cmp r4, -c4.x, r0.y, r4
    mov r5, c1
    mad r1, r1.y, r5, c0
    mad r1, r1, r3, r4
    mul r0, r0.w, r1
    mov r6.y, c20.z
    mul r1, r0, r6.yyxy
    cmp r0, -c6.x, r0, r1
    cmp oC0, -c7.x, r0, r2.x

// approximately 193 instruction slots used (11 texture, 182 arithmetic)
