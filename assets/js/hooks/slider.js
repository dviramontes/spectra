const slider = {
    mounted() {
        this.el.addEventListener("input", (e) => {
            this.pushEvent("update-slider", {value: e.target.value});
        });
    }
}

export default slider;
