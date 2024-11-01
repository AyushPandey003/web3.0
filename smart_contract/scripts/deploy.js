const main = async () => {
    const Transactions = await hre.ethers.getContractFactory("Transactions");
    const transactions = await Transactions.deploy();
    await transactions.waitForDeployment();  // Wait for the contract to be deployed


    console.log("Transactions contract deployed successfully.");
    console.log("Transactions deployed to:", transactions.target);
};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();
