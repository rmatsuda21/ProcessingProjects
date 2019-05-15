def setup():
    size(600,600)

def draw():
    clear()
    rectMode(CENTER)
    rect(mouseX,mouseY,mouseX*50/width,mouseY*50/height);
