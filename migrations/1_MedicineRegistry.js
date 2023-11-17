var MedicineRegistry = artifacts.require("./MedicineRegistry.sol");
 
module.exports = async function(deployer){
    deployer.deploy(MedicineRegistry,{sender: '0xA046566bBac5EDB2B065F33A8d0DD72d7e91F314'});
};