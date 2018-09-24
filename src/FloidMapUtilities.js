// FloidMapUtilities.js
    // faigelabs - test code for Floid maps - cfaigle - free
    //------------------------//
    // Parameters from URL:   //
    //------------------------//
    var params       = {};
    var mapId        = 0;
    var latStart     = 0;
    var lngStart     = 0;
    //--------------------------------//
    // Console log utility function:  //
    //--------------------------------//
    function log(message)
    {
        if(typeof console == "object")
        {
            console.log(message);
        }
    }
    //--------------------------------//
    // Storage for the flash object:  //
    //--------------------------------//
    var swfObject = null;
    //-------------------------//
    // Parse the parameters:   //
    //-------------------------//
    var prmstr       = window.location.search.substr(1);
    var prmarr       = prmstr.split ("&");
    for ( var i = 0; i < prmarr.length; i++)
    {
        var tmparr        = prmarr[i].split("=");
        params[tmparr[0]] = tmparr[1];
    }
    //-------------------------//
    // Get the map id:         //
    //-------------------------//
    if(params['mapId'] != null)
    {
        try
        {
            mapId=Number(params['mapId']);
        }
        catch(err)
        {
             mapId = 0;
        }
    }
    //-------------------------//
    // Get the lat start:      //
    //-------------------------//
    if(params['latStart'] != null)
    {
        try
        {
            latStart=Number(params['latStart']);
        }
        catch(err)
        {
             latStart = 0;
        }
    }
    //-------------------------//
    // Get the lng start:      //
    //-------------------------//
    if(params['lngStart'] != null)
    {
        try
        {
            lngStart=Number(params['lngStart']);
        }
        catch(err)
        {
             lngStart = 0;
        }
    }
    //-------------------------//
    // Get the flash object:   //
    //-------------------------//
    log("obj name: " + params['obj']);
    swfObject = parent.document.getElementById(params['obj']);
    //---------------------//
    // Utility routines:   //
    //---------------------//
    // Sample position calculation:
    function calculateSamples(startLat, startLng, endLat, endLng, actualSamples)
    {
        // OK, make an array of sample points to test:
        var sampleLocations = [];
        for(var i=0; i<actualSamples; ++i)
        {
            var factor       = i / (actualSamples-1);    // Note - again we are including both start and end points...
            log('factor: ' + factor);
            var sampleLat    = startLat + (endLat-startLat) * factor; 
            var sampleLng    = startLng + (endLng-startLng) * factor;
            log('Sample: ' + sampleLat + " " + sampleLng);
            sampleLocations.push(sampleLat, sampleLng);
        }
        return sampleLocations;
    }
    // From: http://stackoverflow.com/questions/5623838/rgb-to-hex-and-hex-to-rgb
    function componentToHex(c)
    {
        var hex = c.toString(16);
        return hex.length == 1 ? "0" + hex : hex;
    }
    function rgbToHex(r, g, b)
    {
        return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
    }
    function argbToHex(a, r, g, b)
    {
        return "#" + componentToHex(a) + componentToHex(r) + componentToHex(g) + componentToHex(b);
    }
    function rgbaToHex(r, g, b, a)
    {
        return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b) + componentToHex(a);
    }