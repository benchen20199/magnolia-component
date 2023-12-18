var listTwo = document.getElementById("list-stations-2");
listTwo.style.display = 'none';
var listOne = document.getElementById("list-stations-1");
listOne.style.display = 'none';

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

function myFunction(element) {

  var btnID = $(element).attr("id");
  var x = "";
  /*
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
  var myObj = JSON.parse(this.responseText);


  for (i in myObj.results) {
  x += "<li><a>" + myObj.results[i].name;
  x += "&nbsp; <em class='lineCode' id='lineCode' style='color:#aaa;'>" + myObj.results[i].code + "</em></a></li>";
}


if (btnID == 'btn-from') {
//alert('from');
document.getElementById("list-stations-1").innerHTML = x;
if (listOne.style.display === 'none') {
listOne.style.display = 'block';
} else {
listOne.style.display = 'none';
}
} else {
//alert('to');
document.getElementById("list-stations-2").innerHTML = x;
if (listTwo.style.display === 'none') {
listTwo.style.display = 'block';
} else {
listTwo.style.display = 'none';
}
} //end if else
}
};
xmlhttp.open("index.html", "//devconnect.smrt.wwprojects.com/smrt/api/stations/?format=json", true);
xmlhttp.send();
*/
$.ajax({
  // url: '//devconnect.smrt.wwprojects.com/smrt/api/stations/',
  // url: 'http://devconnect.smrt.wwprojects.com/smrt/api/stations/',
  url: 'https://connect.smrt.wwprojects.com/smrt/api/stations/',
  type: 'GET',
  data: {
    "format": 'json'
  },
  success: function(data) {
    var myObj = data.results;

    for (var i = 0; i < myObj.length; i++) {
      if (myObj[i].line) {

        x += "<li><a onmousedown='removeStationCode()'>" + myObj[i].name; // start of li

        var tmpLine = myObj[i].line.split(','); // get each line split by ,
        var tmpCode = myObj[i].code.split(','); // get each code split by ,

        // adding - MRT or - LRT
        for (var j = 0; j < tmpLine.length; j++) {
          if (tmpX == ' - LRT') {
            tmpX = '';  // reset for stations with more than 1 line
          }
          var tmpX = '';
          switch (tmpLine[k]) {
            case 'CC':
            case 'NS':
            case 'EW':
            case 'CG':
            case 'DT':
            case 'NE':
            tmpX = ' - MRT';
            break;
            default:
            tmpX = ' - LRT';
            break;
          }

        }
        x += tmpX;

        // adding the colored line contents
        for (var j = 0; j < tmpLine.length; j++) {
          x += "<span class='stationCode " + tmpLine[j] + "' style='color:#FFF;'>" + tmpCode[j] + "</span>";
        }

        x += "</a></li>"; // end of li
      }
    }

    if (btnID == 'btn-from') {
      document.getElementById("list-stations-1").innerHTML = x;
      if (listOne.style.display === 'none') {
        listOne.style.display = 'block';
      } else {
        listOne.style.display = 'none';
      }
    } else {
      document.getElementById("list-stations-2").innerHTML = x;
      if (listTwo.style.display === 'none') {
        listTwo.style.display = 'block';
      } else {
        listTwo.style.display = 'none';
      }
    }
  },
  error: function(data) {
    //alert('woops!'); //or whatever
  }
});
}

// start of reverseRoute
function reverseRoute() {
  var start = document.getElementById('frominput').value;
  var end = document.getElementById('toinput').value;

  document.getElementById('frominput').value = end;
  document.getElementById('toinput').value = start;
}
// end of reverseRoute

var clearInputOne = document.getElementById('frominput');
clearInputOne.onclick = function() {
  listOne.style.display = 'none';
};

var clearInputTwo = document.getElementById('toinput');
clearInputTwo.onclick = function() {
  listTwo.style.display = 'none';
};


// start of autocomplete
$("#frominput, #toinput").on('keyup keydown focus', function() {

  // console.log($(this).val());
  var userInput = $(this);

  // console.log(userInput.val().length);
  delay(function(){
    if (userInput.val().length > 2) {

      $.ajax({
        // url: '//devconnect.smrt.wwprojects.com/smrt/api/all_places/',
        // url: 'http://devconnect.smrt.wwprojects.com/smrt/api/all_places/',
        url: 'https://connect.smrt.wwprojects.com/smrt/api/all_places/',
        type: 'GET',
        data: {
          "name": userInput.val(),
          "format": 'json'
        },
        success: function(data){
          var myObj = data.results;
          var x = "";

          for (var i = 0; i < myObj.length; i++) {

            if (myObj[i].stop) {
              x += "<li><a>" + myObj[i].stop + "</a></li>";
            }
          }

          if (userInput.attr('id') == 'frominput') {
            document.getElementById("list-stations-1").innerHTML = x;
            if (listOne.style.display === 'none') {
              listOne.style.display = 'block';
            }
            // else {
            //   listOne.style.display = 'none';
            // }
          } else {
            document.getElementById("list-stations-2").innerHTML = x;
            if (listTwo.style.display === 'none') {
              listTwo.style.display = 'block';
            }
            // else {
            //   listTwo.style.display = 'none';
            // }
          }
        },
        error: function(data) {
          alert('Something went wrong, please try again.'); //or whatever
        }
      });
    }
  }, 300);
}); // end of autocomplete


// start of hiding lists
$("#frominput, #toinput, #btn-from, #btn-to").on('blur', function() {

  if ($(this).attr('id') == 'frominput') {
    listOne.style.display = 'none';
  } else {
    listTwo.style.display = 'none';
  }
});

$(document).on("click", function() {
  // console.log($(this));
  if (listOne.style.display === 'block') {
    listOne.style.display = 'none';
  } else if (listTwo.style.display === 'block') {
    listTwo.style.display = 'none';
  }
});
// end of hiding lists


// used to remove the station codes e.g. NS9
function removeStationCode() {
  $('.stationCode').remove();
}

// start calculateRoute
function calculateRoute() {

  var selectedJourney = document.getElementById('recentJourney').value;
  var routeOption = document.getElementById('routeOption').value;

  // if nothing is selected for recent journey
  if (selectedJourney == 0) {

    var start = document.getElementById('frominput').value;
    var end = document.getElementById('toinput').value;

    if (start.length == 0 && end.length == 0) {
      alert('Please select start and end places.');
      return;
    } else if (start.length < 3) {
      alert('Please select From location.');
      return;
    }  else if (end.length < 3) {
      alert('Please select To location.');
      return;
    }

    // set cookie
    var recentJourney = start + '|' + end + '|';
    setCookie('recentJourney', recentJourney, 7);

	window.open("http://journey.smrt.com.sg/journey/routing/" + start + "/" + end + '/' + routeOption, '_blank');
    //window.open("http://journeysdev.smrt.wwprojects.com/journey/routing/" + start + "/" + end + '/' + routeOption, '_blank');
    // window.open("//journeysdev.smrt.wwprojects.com/journey/routing/" + start + "/" + end + '/' + routeOption, '_blank');
  }
  // recent journey is selected
  else {
    window.open("http://journey.smrt.com.sg/journey/routing/" + selectedJourney + '/' + routeOption, '_blank');
    // window.open("//journeysdev.smrt.wwprojects.com/journey/routing/" + selectedJourney + '/' + routeOption, '_blank');
  }
}
// end calculateRoute

// function setCookie(cname, cvalue, exdays) {
//   var d = new Date();
//   d.setTime(d.getTime() + (exdays*24*60*60*1000));
//   var expires = "expires="+ d.toUTCString();
//   document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
// }

function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires="+ d.toUTCString();

  var recentJourney = getCookie('recentJourney');
  if (recentJourney != "") {
    cvalue = recentJourney += cvalue;
    // delete_cookie('recentJourney');
  }
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}


loadCookie();
function loadCookie() {
  var recentJourney = getCookie("recentJourney");
  if (recentJourney != "") {
    var journeyList = recentJourney.split('|');
    for (var i = 0; i < journeyList.length; i+=2) {

      if (journeyList[i]) {
        var option = document.createElement("option");
        option.text = journeyList[i] + ' to ' + journeyList[i + 1];
        option.value = journeyList[i] + '/' + journeyList[i + 1];
        // alert(option.value);
        document.getElementById('recentJourney').appendChild(option);
      }
    }
  }
}


// AUTO COMPLETE OLD
// $.get('http://devconnect.smrt.wwprojects.com/smrt/api/all_places/?name=place&format=json', function(data1, status){
//
//   //console.log(JSON.parse(JSON.stringify(data1)));
//   var options = {
//     data: JSON.parse(JSON.stringify(data1)),
//     listLocation: "results",
//     //getValue: "stop",
//     getValue: function(element) {
//       return element.stop;
//     },
//     list: {
//       match: {
//         enabled: true
//       }
//     }
//   }
//
//   $("#frominput, #toinput").easyAutocomplete(options);

//Set values on Input based on selected option
function getEventTarget(e) {
  e = e || window.event;
  return e.target || e.srcElement;
}

var ulOne = document.getElementById('list-stations-1');
var ulTwo = document.getElementById('list-stations-2');
ulOne.onmousedown = function(event) {
  var target = getEventTarget(event);
  document.getElementById("frominput").value = target.innerText;
  document.getElementById("list-stations-1").style.display = 'none';
};
ulTwo.onmousedown = function(event) {
  var target = getEventTarget(event);
  document.getElementById("toinput").value = target.innerText;
  document.getElementById("list-stations-2").style.display = 'none';
};
