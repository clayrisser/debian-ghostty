import Cocoa
import GhosttyKit

extension NSEvent {
    /// Create a Ghostty key event for a given keyboard action.
    func ghosttyKeyEvent(_ action: ghostty_input_action_e) -> ghostty_input_key_s {
        var key_ev = ghostty_input_key_s()
        key_ev.action = action
        key_ev.mods = Ghostty.ghosttyMods(modifierFlags)
        key_ev.keycode = UInt32(keyCode)
        key_ev.text = nil
        key_ev.composing = false
        return key_ev
    }
}
