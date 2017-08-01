if (os_type == os_windows)
{
    if (global.PluginOpenAnimation == -1)
    {
        show_debug_message("****** GET PLUGIN METHOD: PluginOpenAnimation *****");
        global.PluginOpenAnimation = external_define('CChromaEditorLibrary.dll', 'PluginOpenAnimation', dll_cdecl, ty_real, 1, ty_string);
    }
    
    if (global.PluginPlayAnimation == -1)
    {
        show_debug_message("****** GET PLUGIN METHOD: PluginPlayAnimation *****");
        global.PluginPlayAnimation = external_define('CChromaEditorLibrary.dll', 'PluginPlayAnimation', dll_cdecl, ty_real, 1, ty_real);
    }
    
    if (global.PluginOpenAnimation != -1 && global.PluginPlayAnimation != -1)
    {
        if (keyboard_check_released(ord('1')))
        {
            // open effects
            if (global.ChromaChromaLinkEffect == -1)
            {
                global.ChromaChromaLinkEffect = external_call(global.PluginOpenAnimation, 'RandomChromaLinkEffect.chroma');
                show_debug_message('PluginOpenAnimation result='+string(global.ChromaKeyboardEffect));
            }
            if (global.ChromaKeyboardEffect == -1)
            {
                show_debug_message("****** OPEN ANIMATION *****");
                global.ChromaKeyboardEffect = external_call(global.PluginOpenAnimation, 'KeyboardParticleAnimation.chroma');
                show_debug_message('PluginOpenAnimation result='+string(global.ChromaKeyboardEffect));
            }
            // play effects
            if (global.ChromaChromaLinkEffect != -1)
            {
                show_debug_message('PluginPlayAnimation result='+string(external_call(global.PluginPlayAnimation, global.ChromaChromaLinkEffect)));
            }
            if (global.ChromaKeyboardEffect != -1)
            {
                show_debug_message('PluginPlayAnimation result='+string(external_call(global.PluginPlayAnimation, global.ChromaKeyboardEffect)));
            }
        }
    }
}
