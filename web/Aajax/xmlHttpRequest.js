/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 var xmlHttp;
            
            function createXMLHttpRequest() {
                if (window.XMLHttpRequest) {
                    xmlHttp = new XMLHttpRequest();

                } else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");

                } else {
                    alert("Please update your browser!!!.");

                }
            }
            
//            personal details save
            
            function savePDeatils() {
                createXMLHttpRequest();

                var nic = document.getElementById("nic").value;
                var pass = document.getElementById("pass").value;
                var url = "PDetails?nic=" + nic + "&pass=" + pass;
                xmlHttp.open("POST", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function () {

                    if (xmlHttp.readyState === 4 & xmlHttp.status === 200) {
                        //  document.getElementById("msgpanel").innerHTML = xmlHttp.responseText;
                        alert("succesfully saved data.")
                     
                    }
                };
            }