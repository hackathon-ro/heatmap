

require(["jquery"], function($) {

    $(function() {

      function HeatMap() {
        var that = this;
        this.backendUrl = "http://localhost/rac-heatmap/test.pl";
        this.tellServer = function(x,y,but) {
          var urlLocation = window.document.location.href;
          var clickData = {
            url: urlLocation,
            x  : x,
            y  : y,
            button: but
          };
          $.ajax({
            type    : 'POST',
            url     : that.backendUrl,
            data    : clickData,
            success : function(e) {
            },
          });
        };

        this.clickCallback = function(ev) {
            var x = ev.pageX;
            var y = ev.pageY;
            var button = ev.button;
            that.tellServer(x,y,button);
        };


        $(document).on("click",this.clickCallback);
      };


      $(document).ready(function() {
        window.heatmap = new HeatMap();
        console.log("doc ready");
      });
    });
});










