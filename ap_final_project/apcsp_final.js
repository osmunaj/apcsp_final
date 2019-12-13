function ready(){
    console.log("Page Ready");
    
    

    let sharpnotes = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"] 
    let flatnotes  = ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab" ]

    load.onclick = function(){
        let scale_form = document.forms.scale_form;
        let note = scale_form.tonic.value;
        let scale_type = scale_form.scales.value;
        let sharp_or_flat = "none"
        // console.log(note)
        // console.log(scale_type)
        //let real_note = false;
        let real_note = false
        let i = 0
        let note_value = 0
        let final_scale = ""
        if (note == "Fb"){
            note = "E";
        }
        if (note == "E#"){
            note = "F";
        }
        if (note == "B#"){
            note = "C";
        }
        if (note == "Cb"){
            note = "B";
        }
        while (i < 12 && real_note == false){
            if(note == sharpnotes[i]){
                real_note = true;
                sharp_or_flat = "sharp"
                if (note == "F"){
                    sharp_or_flat = "flat"
                }
                note_value = i;
            }else{
                i += 1;
                real_note = false;
            }
        }
        i = 0
        while (i < 12 && real_note == false){
            if(note == flatnotes[i]){
                real_note = true;
                sharp_or_flat = "flat"
                note_value = i;
            }else{
                i += 1;
                real_note = false;
            }
        }

        if(real_note == false){
            if(note == ""){
                alert("Please type in a note.")
            }else{
                alert("Not a real note.")
            }
        }

        // if (note == "G" || note == "D" || note == "A" || note == "E" || note == "B"){
        //     sharp_or_flat == "sharp"
        // }
        

        let major_scale = [2, 2, 1, 2, 2, 2, 1]
        let natural_minor_scale = [2, 1, 2, 2, 1, 2, 2]
        let harmonic_minor_scale = [2, 1, 2, 2, 1, 3, 1]
        let dorian_mode_scale = [2, 1, 2, 2, 2, 1, 2]
        let phrygian_mode_scale = [1, 2, 2, 2, 1, 2, 2]
        let lydian_mode_scale = [2, 2, 2, 1, 2, 2, 1]
        let mixolydian_mode_scale = [2, 2, 1, 2, 2, 1, 2]
        let locrian_mode_scale = [1, 2, 2, 1, 2, 2, 2]
        let blues_scale = [3, 2, 1, 1, 3, 2]
        
        
        

        if (scale_type == "major"){
            i = 0
            if (sharp_or_flat == "sharp"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (sharpnotes[note_value]) + " "
                    note_value += major_scale[i]
                    i += 1
                }
            }else if (sharp_or_flat == "flat"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (flatnotes[note_value]) + " "
                    note_value += major_scale[i]
                    i += 1
                }
            }
        }

        if (scale_type == "locrian_mode"){
            i = 0
            if (sharp_or_flat == "sharp"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (sharpnotes[note_value]) + " "
                    note_value += locrian_mode_scale[i]
                    i += 1
                }
            }else if (sharp_or_flat == "flat"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (flatnotes[note_value]) + " "
                    note_value += locrian_mode_scale[i]
                    i += 1
                }
            }
        }
        if (scale_type == "lydian_mode"){
            i = 0
            if (sharp_or_flat == "sharp"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (sharpnotes[note_value]) + " "
                    note_value += lydian_mode_scale[i]
                    i += 1
                }
            }else if (sharp_or_flat == "flat"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (flatnotes[note_value]) + " "
                    note_value += lydian_mode_scale[i]
                    i += 1
                }
            }
        }
        if (scale_type == "natural_minor"){
            i = 0
            if (sharp_or_flat == "sharp"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (sharpnotes[note_value]) + " "
                    note_value += natural_minor_scale[i]
                    i += 1
                }
            }else if (sharp_or_flat == "flat"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (flatnotes[note_value]) + " "
                    note_value += natural_minor_scale[i]
                    i += 1
                }
            }
        }
        if (scale_type == "phrygian_mode"){
            i = 0
            if (sharp_or_flat == "sharp"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (sharpnotes[note_value]) + " "
                    note_value += phrygian_mode_scale[i]
                    i += 1
                }
            }else if (sharp_or_flat == "flat"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (flatnotes[note_value]) + " "
                    note_value += phrygian_mode_scale[i]
                    i += 1
                }
            }
        }
        if (scale_type == "harmonic_minor"){
            i = 0
            if (sharp_or_flat == "sharp"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (sharpnotes[note_value]) + " "
                    note_value += harmonic_minor_scale[i]
                    i += 1
                }
            }else if (sharp_or_flat == "flat"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (flatnotes[note_value]) + " "
                    note_value += harmonic_minor_scale[i]
                    i += 1
                }
            }
        }
        if (scale_type == "dorian_mode"){
            i = 0
            if (sharp_or_flat == "sharp"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (sharpnotes[note_value]) + " "
                    note_value += dorian_mode_scale[i]
                    i += 1
                }
            }else if (sharp_or_flat == "flat"){
                while (i < 8){
                    note_value %= 12
                   final_scale += (flatnotes[note_value]) + " "
                    note_value += dorian_mode_scale[i]
                    i += 1
                }
            }
        }
        if (scale_type == "mixolydian_mode"){
            i = 0
            if (sharp_or_flat == "sharp"){
                while (i < 8){
                    note_value %= 12
                    final_scale += (sharpnotes[note_value]) + " "
                    note_value += mixolydian_mode_scale[i]
                    i += 1
                }
            }else if (sharp_or_flat == "flat"){
                while (i < 8){
                    note_value %= 12
                   final_scale += (flatnotes[note_value]) + " "
                    note_value += mixolydian_mode_scale[i]
                    i += 1
                }
            }
        }
        if (scale_type == "blues"){
            i = 0
            if (sharp_or_flat == "sharp"){
                while (i < 7){
                    note_value %= 12
                    final_scale += (sharpnotes[note_value]) + " "
                    note_value += blues_scale[i]
                    i += 1
                }
            }else if (sharp_or_flat == "flat"){
                while (i < 7){
                    note_value %= 12
                    final_scale += (flatnotes[note_value])  + " "
                    note_value += blues_scale[i]
                    i += 1
                }
            }
        }
        
        let final_scale_type = ""

        if (scale_type == "major"){
            final_scale_type = "Major"
        }
        if (scale_type == "phrygian_mode"){
            final_scale_type = "Phrygian"
        }
        if (scale_type == "lydian_mode"){
            final_scale_type = "Lydian"
        }
        if (scale_type == "natural_minor"){
            final_scale_type = "Aeolian (Natural Minor)"
        }
        if (scale_type == "locrian_mode"){
            final_scale_type = "Locrian"
        }
        if(scale_type == "harmonic_minor"){
            final_scale_type = "Harmonic Minor"
        }
        if(scale_type == "dorian_mode"){
            final_scale_type = "Dorian"
        }
        if(scale_type == "mixolydian_mode"){
            final_scale_type = "Mixolydian"
        }
        if(scale_type == "blues"){
            final_scale_type = "Blues"
        }

        console.log(final_scale)
        document.getElementById("type").textContent = note + " "+ final_scale_type
        document.getElementById("final").textContent = final_scale
    };
}

document.addEventListener("DOMContentLoaded", ready);