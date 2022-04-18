function notselected(){
    starItem.color = isCurrent ? palette.highlight : index % 2 == 0 ? evenBackgroundColor : oddBackgroundColor
}

function selected(){
    starItem.color = isCurrent ? palette.highlight : selectedBackgroundColor;
}
