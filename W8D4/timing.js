class Clock {
    constructor() {

        let date = new Date();
        this.hours = date.getHours();
        this.minutes = date.getMinutes();
        this.seconds = date.getSeconds();

        this.printTime()

        setInterval(this._tick.bind(this), 1000);
        // 1. Create a Date object.
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.
    }

    printTime() {
        console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
        // Format the time in HH:MM:SS
        // Use console.log to print it.
    }

    _tick() {

        this.resetTime()

        this.seconds += 1
            
        this.printTime()
        // 1. Increment the time by one second.
        // 2. Call printTime.
    }

    resetTime() {
        if (this.hours >= 25) {
            this.hours = 0, this.minutes = 0, this.seconds = 0
        } else if (this.minutes >= 60) {
            this.minutes = 0
        } else if (this.seconds >= 60) {
            this.seconds = 0
        }
    }
}

const clock = new Clock();
