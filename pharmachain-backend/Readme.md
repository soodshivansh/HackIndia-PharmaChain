initial setup commmands:

truffle(development)> let instance = await MedicineSupplyChain.deployed();
truffle(development)> await instance.registerMedicine(101, "Paracetamol", "ABC Pharma", "2025-12-31", { from: "0xYourAddress" });
truffle(development)> await instance.updateMedicineStatus(101, "shipped", { from: "0xYourAddress" });
truffle(development)> let medicine = await instance.medicines(101);
truffle(development)> console.log(medicine);
