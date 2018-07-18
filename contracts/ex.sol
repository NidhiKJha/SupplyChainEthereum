pragma solidity ^0.4.18;

contract Shipper_exporter {
    struct Shipment {
        uint shipment_id;
        address exporter_id;
        address shipper_id;
        string name;
        string description;
        uint load_weight;
        uint load_value;
        uint transport_charges; //depend on load_weight
        uint demurrage_rates; //depend on load_value
    }

    mapping(uint => Shipment) public shipments;
    uint shipment_counter;

    event LogShipment(
        uint indexed shipment_id,
        address indexed exporter_id,
        address indexed shipper_id,
        string name,
        string description,
        uint load_weight,
        uint load_value,
        uint transport_charges,
        uint demurrage_rates
    );

    function loadShipment(
    // uint _shipment_id,
    // address _exporter_id,
    // address _shipper_id,
        string _name,
        string _description,
        uint _load_weight,
        uint _load_value,
        uint _transport_charges,
        uint _demurrage_rates
    ) public {
        shipment_counter++;

        shipments[shipment_counter] = Shipment(
            shipment_counter,
            msg.sender,
            0x0,
            _name,
            _description,
            _load_weight,
            _load_value,
            _transport_charges,
            _demurrage_rates
        );

        //shipper pay exporter half of transport cost…. receipt generated (event 1)
        //assets loaded onto ship
    }

    function shipmentDamages() public {
        //risk insurance of 5$ per pound exporter must pay in case of damages
    }

    function ShipmentDelivery() public {
        //if load delivered within 30 days of signing receipt rest half of payment to be made provided no damages.
        //else if within 30 days but some damages then rates adjusted according to damages
        //else if  30 days exceeded exporter must pay demurrage according to mutually agreed rates
        //else if 30 days limit exceeded and also other damages then further damages + demurrage applicable
    }

}
