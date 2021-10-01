//SPDX-License-Identifier: GPL-3.0;
pragma solidity >= 0.5.4 < 8.5.0;

// @title Cryptozombies tutorial code
// @author Dhiv Joseph
/* Contract description - a some code snippets with slight refactoring from the cyrptozombies solidity tutorial game.

Visit cryptozombies: https://cryptozombies.io/ to learn Solidity. I really enjoyed the tutorial and highly recommend completing this if you're
just starting with solidity.
*/

contract ZombieFactory {
    // event to frontend. This generally let's the user know of any outputs.
    event NewZombie(uint _id, string _name, uint _dna);

    // zombie state variables
    uint dnaDigits = 16; 
    uint dnaModulus = 10 ** dnaDigits;

<<<<<<< HEAD
    // a common data type in Solidity. Comes with a built-in constructor
=======
    // a common type in Solidity. Comes with a built-in constructor
>>>>>>> 2e703be42c1a5505817c314b3c35a7ce55cd04aa
    struct Zombie {
        string name;
        uint dna;
    }

    // public, all zombies
    Zombie[] public zombies; // a dynamic array.

    // zombie ownership and allocation count 
    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;

    function _createZombies(string memory _name, uint _dna) private {
        // this combines structs and arrays to make the zombie data
        // then pushed to the public zombies array
        uint id = zombies.push(Zombie(_name, _dna)) - 1;

        // assigning ownership and increment counter
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;

        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        // using built-in keccak256 hash function to make a prng uint
        // don't use this to generate rand ints in on-chain contract
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    // create zombie - exposed for users to call and make a zombie!
    // _name is the user input from front end (caller)
    function createZombies(string memory _name) public {
        // limit zombie creation to one per account.
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createZombies(_name, randDna);
    }
    
}
