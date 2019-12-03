function ready(){
    console.log("Page Ready");
    
    i = 0

    let sharpnotes = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"] 
    let flatnotes  = ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab" ]

    load.onclick = function(){
        let scale_form = document.forms.scale_form;

        let note = scale_form.tonic.value;
        let scale_type = scale_form.scales.value;
        console.log(note)
        console.log(scale_type)

        let real_note = false;

        if(sharpnotes[i] == note){
            real_note = true
        }else{
            real_note = false
            i += 1
            if(i == 12){
                i = 1
                if(flatnotes[i] == note){
                    real_note = true
                }else{
                    real_note = false
                    i ++

                    if(i == 12){
                        real_note = false
                        alert("Not a real note")
                    }
                }
            }
        } 

        console.log(real_note)

    };
}

document.addEventListener("DOMContentLoaded", ready);

