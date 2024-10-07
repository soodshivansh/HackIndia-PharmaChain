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
    mapping(address => uint256[]) public userTransactions; // to track batch numbers registered by user

    event MedicineRegistered(uint256 batchNumber, string name, string manufacturer);
    event StatusUpdated(uint256 batchNumber, string status);

    // Register medicine
    function registerMedicine(uint256 batchNumber, string memory name, string memory manufacturer, string memory expiryDate) public {
        require(bytes(name).length > 0, "Medicine name cannot be empty");
        require(bytes(manufacturer).length > 0, "Manufacturer cannot be empty");
        require(bytes(expiryDate).length > 0, "Expiry date cannot be empty");

        medicines[batchNumber] = Medicine(batchNumber, name, manufacturer, expiryDate, "manufactured");
        userTransactions[msg.sender].push(batchNumber); // Tracking the batch number registered by the user
        emit MedicineRegistered(batchNumber, name, manufacturer);
    }

    // Update medicine status
    function updateMedicineStatus(uint256 batchNumber, string memory newStatus) public {
        require(bytes(medicines[batchNumber].name).length > 0, "Medicine not registered");
        require(bytes(newStatus).length > 0, "New status cannot be empty");

        medicines[batchNumber].status = newStatus;
        emit StatusUpdated(batchNumber, newStatus);
    }

    // Get all transactions made by the user
    function getUserTransactions() public view returns (uint256[] memory) {
        return userTransactions[msg.sender];
    }

    // Get details of a medicine by batch number
    function getMedicineDetails(uint256 batchNumber) public view returns (string memory name, string memory manufacturer, string memory expiryDate, string memory status) {
        require(bytes(medicines[batchNumber].name).length > 0, "Medicine not found");
        
        Medicine memory medicine = medicines[batchNumber];
        return (medicine.name, medicine.manufacturer, medicine.expiryDate, medicine.status);
    }
}

