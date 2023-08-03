//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Tracking{
    enum ShipmentStatus{PENDING,IN_TRANSIT,DELIVERED}


    struct Shipment{
        address sender;
        address receiver;
        uint256 pickupTime;
        uint256 deliveryTime;
        uint256 distance;
        uint256 price;
        ShipmentStatus Status;
        bool isPaid;
    }

    mapping(address => Shipment[]) public shipments;
    uint256 public shipmentCount;


    struct TypeShipment{
        address sender;
        address receiver;
        uint256 pickupTime;
        uint256 deliveryTime;
        uint256 distance;
        uint256 price;
        ShipmentStatus Status;
        bool isPaid;
 }

 TypeShipment[] typeShipments;

event ShipmenCreated(address indexed sender , address indexed receiver, uint256 pickupTime, uint256 deliveryTime, uint256 distance, uint256 price);
event ShipmentInTransit(address indexed sender , address indexed receiver, uint256 pickupTime);
event ShipmentDelivered(address indexed sender , address indexed receiver, uint256 deliveryTime);
event ShipmentPaid(address indexed sender , address indexed receiver, uint256 amount);

constructor(){
    shipmentCount = 0;

}

function createShipment(address _receiver, uint256 _pickupTime, uint256 _distance, uint256 _price)public payable{
     require (msg.value == _price, "Payment amount must match the price.")

Shipment memory shipment = Shipment(msg.sender, _receiver, _pickupTime, 0 , _distance, _price , ShipmentStatus.PENDING , false);

shipments[msg.sender].push(shipment);
shipmentCount++;


typeShipments.push(
    TypeShipment(
        msg.sender,
        _receiver,
        _distance,
        _pickupTime,
        0,
        _price,
        ShipmentStatus.PENDING,
false
    )
     
);

 emit ShipmenCreated(msg.sender, _receiver, _distance,_pickupTime,_price)


}





























}