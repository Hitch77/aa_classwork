class View {
  constructor(game, el) {
    this.el = el
    this.game = game
    this.setupBoard()
    this.bindEvents()
  }

  setupBoard() {
    let ul = document.createElement('ul')
    
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let li = document.createElement('li')
        li.dataset.pos = `${i},${j}`
        ul.appendChild(li)
      }
    }
    
    this.el.appendChild(ul)
    console.log(ul)

  }
  
  bindEvents() {
    // this.handleClick
    this.el.addEventListener('click', this.handleClick.bind(this))
  }

  handleClick(e) {
    e.preventDefault()
    e.stopPropagation()
    let clicked = e.target
    if (clicked.tagName === 'LI') {
      this.makeMove(clicked)
    }
  }

  makeMove(square) {
    let pos = square.dataset.pos.split(",").map(x=>+x)
    this.game.playMove(pos)
  }

}

module.exports = View;
