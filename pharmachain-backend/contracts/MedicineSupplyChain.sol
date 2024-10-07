pragma solidity ^0.5.0;

contract MedicineSupplyChain {
    struct Medicine {
        uint256 batchNumber;
        string name;
        string manufacturer;
        string expiryDate;
        string status;  // Example statuses: "manufactured", "shipped", "received"
    }

    mapping(uint256 => Medicine) public medicines;

    event MedicineRegistered(uint256 batchNumber, string name, string manufacturer);
    event StatusUpdated(uint256 batchNumber, string status);

    // register medicine
    function registerMedicine(uint256 batchNumber, string memory name, string memory manufacturer, string memory expiryDate) public {
        medicines[batchNumber] = Medicine(batchNumber, name, manufacturer, expiryDate, "manufactured");
        emit MedicineRegistered(batchNumber, name, manufacturer);
    }

    // update medicine
    function updateMedicineStatus(uint256 batchNumber, string memory newStatus) public {
        require(bytes(medicines[batchNumber].name).length > 0, "Medicine not registered");
        medicines[batchNumber].status = newStatus;
        emit StatusUpdated(batchNumber, newStatus);
    }
}
