// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract MedicineRegistry {
    struct Medicine {
        uint manufacturer_id;
        string manufacturer_name;
        string medicine_name;
        string constituents;
        string tracker;
        string qr_code;
    }

    mapping(string => Medicine) medicines;
    mapping(string => bool) qrCodes;

    function setMedicine(
        uint _manufacturer_id,
        string memory _manufacturer_name,
        string memory _medicine_name,
        string memory _constituents,
        string memory _tracker,
        string memory _qr_code
    ) public {
        require(!qrCodes[_qr_code], "QR code already in use");
        
        Medicine storage newMedicine = medicines[_qr_code];
        newMedicine.manufacturer_id = _manufacturer_id;
        newMedicine.manufacturer_name = _manufacturer_name;
        newMedicine.medicine_name = _medicine_name;
        newMedicine.constituents = _constituents;
        newMedicine.tracker = _tracker;
        newMedicine.qr_code = _qr_code;
        
        qrCodes[_qr_code] = true;
    }

    function getMedicine(string memory _qr_code) public view returns (
        uint manufacturer_id,
        string memory manufacturer_name,
        string memory medicine_name,
        string memory constituents,
        string memory tracker,
        string memory qr_code
    ) {
        Medicine storage med = medicines[_qr_code];
        require(bytes(med.qr_code).length != 0, "Medicine not found");
        
        manufacturer_id = med.manufacturer_id;
        manufacturer_name = med.manufacturer_name;
        medicine_name = med.medicine_name;
        constituents = med.constituents;
        tracker = med.tracker;
        qr_code = med.qr_code;
    }
}