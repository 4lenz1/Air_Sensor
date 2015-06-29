import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtGraphicalEffects 1.0
Window {
    signal submitTextField(string text)

    // this function is our QML slot
    function getSensorMq4Data(data){
        //console.log("getData: " + data)
        rectmq4.height =   data;
        if(data > 150 ){
            aniAlertMq4.start();
        }else{
            aniSafeMq4.start();
        }

        numMq4.text= data
    }

    ColorAnimation {
        id: aniAlertMq4
        target: rectmq4
        duration: changeSpeed
        easing.type: Easing.InOutQuad
        to:"red"
    }
    ColorAnimation {
        id: aniSafeMq4
        target: rectmq4
        duration: changeSpeed
        easing.type: Easing.InOutQuad
        to: "green"
    }
    function getSensorMq5Data(data){
        // console.log("getData: " + data)
        rectmq5.height =  data ;
        if(data > 150 ){
            rectmq5.color = "red";
        }else{
            rectmq5.color = "green";
        }
        numMq5.text= data
    }
    function getSensorMq9Data(data){
        // console.log("getData: " + data)
        rectmq9.height =    data;
        if(data > 150 ){
            rectmq9.color = "red";
        }else{
            rectmq9.color = "green";
        }
        numMq9.text= data
    }


    visible: true
    width: 800
    height: 600
    property int changeSpeed: 2000
    Item{
        id:mainItem
        width: parent.width
        height: parent.height


        Rectangle{
            id:frame
            anchors.right: parent.right
            height: parent.height
            //width: parent.width / 5 * 4
            width : parent.width
            color : "black"
            Text{
                id : title
                text:"Sensor on Arduino "
                color : "yellow"
                font.family: "NEOTERIC"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top:  parent.top
                font.pixelSize: 40
            }

            Rectangle{
                id : warn
                height:  3
                anchors.bottom: txtMq5.top
                anchors.bottomMargin: 150
                width:  parent.width
                color : "red"
                RectangularGlow {
                    id: effectWarn
                    anchors.fill: parent
                    glowRadius: 25
                    spread: 0
                    color: parent.color
                    cornerRadius: parent.radius + glowRadius
                }

                SequentialAnimation{
                    running : true
                    loops:Animation.Infinite
                    NumberAnimation {
                        target: warn
                        property: "opacity"
                        duration: 3000
                        easing.type: Easing.InOutQuad
                        from :1
                        to : .3
                    }
                    NumberAnimation {
                        target: warn
                        property: "opacity"
                        duration: 3000
                        easing.type: Easing.InOutQuad
                        from :  .3
                        to : 1
                    }
                }
            }

            Text{
                id:txtMq4
                text:"Methane\nand\nCNG Gas"
                horizontalAlignment: Text.AlignHCenter
                anchors.bottom: parent.bottom
                // anchors.left:  parent.left
                anchors.horizontalCenter: rectmq4.horizontalCenter
                color : "white"
                font.family: "NEOTERIC"
                font.pixelSize: 20
            }
            Text{
                id:txtMq5
                text:"Natural gas\nand\nLPG"
                horizontalAlignment: Text.AlignHCenter
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
                font.family: "NEOTERIC"
                color : "white"
            }
            Text{
                id:txtMq9
                text:" Carbon Monoxide\nand\nflammable gasses"
                horizontalAlignment: Text.AlignHCenter
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: rectmq9.horizontalCenter
                font.family: "NEOTERIC"
                color : "white"
                font.pixelSize: 20
            }

            Rectangle{
                id : rectmq9
                color : "yellow"
                //anchors.centerIn:  parent
                anchors.right:  parent.right
                //anchors.horizontalCenter: txtMq9.horizontalCenter
                anchors.bottom:  txtMq9.top
                width: parent.width / 5;
                height :  parent.height
                radius : 3

                Behavior  on height {
                    NumberAnimation{
                        duration: changeSpeed
                        easing.type:  Easing.OutCubic;
                    }// end NumberAnimation
                } // end Behavior

                RectangularGlow {
                    id: effectmq9
                    height: mainItem.height
                    anchors.fill: parent
                    glowRadius: 10
                    spread: 0.2
                    color: parent.color
                    cornerRadius: parent.radius + glowRadius

                    Text{
                        id : numMq9
                        text:""
                        color : "black"
                        font.pixelSize: 24
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter:  parent.horizontalCenter
                    }
                }
            }

            Rectangle{
                id : rectmq5
                color : "Blue"
                //anchors.centerIn:  parent
                anchors.horizontalCenter: txtMq5.horizontalCenter
                anchors.bottom: txtMq5.top
                width: parent.width / 5
                height :  parent.height
                radius: 3
                Behavior  on height {
                    NumberAnimation{
                        duration: changeSpeed
                        easing.type:  Easing.OutCubic;
                    }// end NumberAnimation
                } // end Behavior

                RectangularGlow {
                    id: effectmq5
                    anchors.fill: parent
                    glowRadius: 10
                    spread: 0.2
                    color: parent.color
                    cornerRadius: parent.radius + glowRadius
                    Text{
                        id : numMq5
                        text:""
                        color : "black"
                        font.pixelSize: 24
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter:  parent.horizontalCenter
                    }
                }
            }
            Rectangle{
                id : rectmq4
                color : "Green"
                //anchors.horizontalCenter: txtMq4.horizontalCenter
                anchors.left:  parent.left
                anchors.bottom: txtMq4.top
                width:  parent.width / 5
                height:  parent.height
                radius:  4

                Behavior on height {
                    NumberAnimation{
                        duration: changeSpeed
                        easing.type: Easing.OutCubic
                    }
                }


                RectangularGlow {
                    id: effectmq4
                    anchors.fill: parent
                    glowRadius: 25
                    spread: 0
                    color: parent.color
                    cornerRadius: parent.radius + glowRadius
                    Text{
                        id : numMq4
                        text:""
                        color : "black"
                        font.pixelSize: 24
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter:  parent.horizontalCenter
                    }
                }
            }

        }// end Frame
    }//  end mainItem
}
