//SPDX-License-Identifier: GPL-3.0;
pragma solidity ^0.8.4;

// @title Cryptozombies code snippets
// @author Dhiv Joseph
/* Contract description - a some code snippets with slight refactoring from the cyrptozombies solidity tutorial game.

Visit cryptozombies: https://cryptozombies.io/ to learn Solidity. I highly recommend it.
*/

contract ZombieFactory {
    // event to frontend
    event NewZombie(uint _id, string _name, uint _dna);

    // zombie state variables
    uint dnaDigits = 16; 
    uint dnaModulus = 10 ** dnaDigits;

    // a common type in Solidity. Comes with a built-in constructor

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies; // a dynamic array

    function _createZombies(string memory _name, uint _dna) private {
        // combining structs and arrays to make zombies. Pushing to our zombie list
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        // using built-in keccak256 hash function to make a pseudo-random uint
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    // create zombie - exposed for users to call and make a zombie!
    function createZombies(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombies(_name, randDna);
    }
    
}