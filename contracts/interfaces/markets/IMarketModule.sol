// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

/**
 * @title IMarketModule
 * @author TheBards Protocol
 *
 * @notice This is the standard interface for all TheBards-compatible NFT trade modules.
 */
interface IMarketModule {
	/**
     * @notice Initializes data for a given publication being published. This can only be called by the hub.
     *
     * @param tokenContract The address of content NFT contract
     * @param tokenId The token ID of content NFT contract.
     * @param data Arbitrary data __passed from the user!__ to be decoded, such as price.
     *
     * @return bytes An abi encoded byte array encapsulating the execution's state changes. This will be emitted by the
     * hub alongside the collect module's address and should be consumed by front ends.
     */
    function initializeModule(
        address tokenContract,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes memory);

	/**
     * @notice Processes a buy action for a given NFT, this can only be called by the hub.
     *
     * @param tokenContract The address of content NFT contract.
     * @param tokenId The token ID of content NFT contract.
     * @param data Arbitrary data __passed from the collector!__ to be decoded, such as curators' shares.
     */
    function buy(
        address tokenContract,
        uint256 tokenId,
        bytes calldata data
    ) external;
	
}