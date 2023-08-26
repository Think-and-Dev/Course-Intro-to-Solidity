// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Solow NFT", "SLWNFT") {}

    function awardSolowSolidityCourse(address student) external returns (uint256) {
        require(student != address(0), "INVALID STUDENT ADDRESS");
        uint256 newStudentId = _tokenIds.current();
        _mint(student, newStudentId);

        _tokenIds.increment();
        return newStudentId;
    }
}
