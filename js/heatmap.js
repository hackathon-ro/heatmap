

require(["jquery"], function($) {

    $(function() {

      function HeatMap() {
        this.url = "localhost/cgi-bin/
        this.tellServer = function(x,y) {

        };

        this.clickCallback = function(ev) {
            var x = ev.pageX;
            var y = ev.pageY;
            console.log(x+" "+y);
        };


        $(document).on("click",this.clickCallback);
      };


      $(document).ready(function() {
        window.heatmap = new HeatMap();
        console.log("doc ready");
      });
    });
});




























