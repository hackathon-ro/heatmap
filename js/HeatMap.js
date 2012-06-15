

require(["jquery","heatmap"], function($) {

    $(function() {

      function HeatMap() {
        var that = this;
        this.recordUrl = "http://localhost/rac-heatmap/receive.pl";
        this.generateUrl = "http://localhost/rac-heatmap/generate.pl";
        this.heatmapInstance = null;
        this.tellServer = function(x,y,but) {
          var urlLocation = window.document.location.href;
          var clickData = {
            type   : "click",
            url    : urlLocation,
            x      : x,
            y      : y,
            button : but
          };
          $.ajax({
            type    : 'POST',
            url     : that.recordUrl,
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

        this.genOverlay = function(type) {
          var width                = document.body.clientWidth;
          var height               = document.body.clientHeight;
          var overlayElement = document.createElement("div");
          overlayElement.style.cssText = "position:absolute;left:0;top:28px;width:"+width+"px;height:"+height+"px;z-index:999999999;";
          document.body.appendChild(overlayElement);

          this.heatmapInstance = h337.create({
            width   : width,
            height  : height,
            element : overlayElement,
            visible : true
          });
          var genUrl = that.generateUrl
                        +"?url="+window.document.location.href 
                        +"&type="+type
                        +"&bucket_size=100";
          $.ajax({
            type    : 'GET',
            url     : genUrl,
            success : function(data) {
              //debugger;
              that.heatmapInstance.store.setDataSet(data);
            },
          });
          //this.heatmapInstance.store.setDataSet(data)
        };


        $(document).on("click",this.clickCallback);
      };


      $(document).ready(function() {
        window.heatmap = new HeatMap();
        console.log("doc ready");
      });
    });
});










