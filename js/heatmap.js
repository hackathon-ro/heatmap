

require(["jquery"], function($) {

    $(function() {

      function HeatMap() {
        var that = this;
        this.backendUrl = "http://localhost/rac-heatmap/test.pl";
        this.tellServer = function(x,y) {
          var clickData = {
            url: window.location.toString(),
            x  : x,
            y  : y,
          };
          $.ajax({
            type    : 'POST',
            url     : that.backendUrl,
            data    : clickData,
            success : function(e) {
              console.log(e);
            },
          });
        };

        this.clickCallback = function(ev) {
            var x = ev.pageX;
            var y = ev.pageY;
            console.log(x+" "+y);
            that.tellServer(x,y);
        };


        $(document).on("click",this.clickCallback);
      };


      $(document).ready(function() {
        window.heatmap = new HeatMap();
        console.log("doc ready");
      });
    });
});




























