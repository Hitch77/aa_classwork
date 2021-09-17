import React from 'react'

class Calculator extends React.Component {
    constructor(props){
    super(props);
    this.state = {
        result: 0,
        num1: "",
        num2: ""
    }
    this.setNum1 = this.setNum1.bind(this)
    this.setNum2 = this.setNum2.bind(this)
    this.Add = this.Add.bind(this)
    }

    setNum1(e){
        return this.setState({num1: e.target.value})
    }

    setNum2(e){
        return this.setState({num2: e.target.value})
    }

    Add(e){
        e.preventDefault()
        this.setState({result: (parseInt(this.state.num1) + parseInt(this.state.num2))})
    }



    render () {
        return (
            <div>
                <h1>{this.state.result}</h1>
                <input type="text" value={this.state.num1} onChange={this.setNum1}></input>
                <input type="text" value={this.state.num2} onChange={this.setNum2}></input>
                <button onClick={this.Add}>+</button>
            </div>
        )
    }
}
export default Calculator;