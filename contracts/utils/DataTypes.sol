// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

/**
 * @title DataTypes
 * @author TheBards Protocol
 *
 * @notice A standard library of data types used throughout the bards Protocol.
 */
library DataTypes {

	enum ContentType {
		Microblog,
        Article,
        Audio,
        Video
	}

	enum CurationType {
		Profile,
        Content,
        Combined,
        Protfolio,
        Feed,
        Dapp
	}

    /**
     * @notice An enum containing the different states the protocol can be in, limiting certain actions.
     *
     * @param Unpaused The fully unpaused state.
     * @param CurationPaused The state where only curation creation functions are paused.
     * @param Paused The fully paused state.
     */
    enum ProtocolState {
        Unpaused,
        CurationPaused,
        Paused
    }

    /**
     * @notice A struct containing profile Curation data.
     *
     * @param handle The profile's associated handle.
     * @param contentURI The URI to be used for the profile's image.
     * @param marketModule The address of the current market module in use by this profile, can be empty.
     */
    struct ProfileCurationStruct {
        string handle;
        string contentURI;
        address marketModule;
    }

    /**
     * @notice A struct containing data associated with each new Content Curation.
     *
     * @param curationIdPointed The profile token ID this curation points to, for mirrors and comments.
     * @param contentURI The URI associated with this publication.
     * @param marketModule The address of the current reference module in use by this profile, can be empty.
     */
    struct CurationStruct {
        uint256 curationIdPointed;
        string contentURI;
        address marketModule;
    }

    /**
     * @notice A struct containing the parameters required for the `createProfile()` function.
     *
     * @param to The address receiving the profile.
     * @param handle The handle to set for the profile, must be unique and non-empty.
     * @param contentURI The URI to set for the profile metadata.
     * @param marketModule The market module to use, can be the zero address.
     * @param marketModuleInitData The market module initialization data, if any.
     */
    struct CreateProfileData {
        address to;
        string handle;
        string contentURI;
        address marketModule;
        bytes marketModuleInitData;
    }

    /**
     * @notice A struct containing the parameters required for the `setDefaultProfileWithSig()` function. Parameters are
     * the same as the regular `setDefaultProfile()` function, with an added EIP712Signature.
     *
     * @param wallet The address of the wallet setting the default profile.
     * @param profileId The token ID of the profile which will be set as default, or zero.
     * @param sig The EIP712Signature struct containing the profile owner's signature.
     */
    struct SetDefaultProfileWithSigData {
        address wallet;
        uint256 profileId;
        EIP712Signature sig;
    }

    /**
     * @notice A struct containing the parameters required for the `setMarketModuleWithSig()` function. Parameters are
     * the same as the regular `setMarketModule()` function, with an added EIP712Signature.
     *
     * @param curationId The token ID of the curation to change the marketModule for.
     * @param marketModule The marketModule to set for the given curation, must be whitelisted.
     * @param marketModuleInitData The data to be passed to the marketModule for initialization.
     * @param sig The EIP712Signature struct containing the profile owner's signature.
     */
    struct SetMarketModuleWithSigData {
        uint256 curationId;
        address marketModule;
        bytes marketModuleInitData;
        EIP712Signature sig;
    }

	/**
     * @notice A struct containing the necessary information to reconstruct an EIP-712 typed data signature.
     *
     * @param v The signature's recovery parameter.
     * @param r The signature's r parameter.
     * @param s The signature's s parameter
     * @param deadline The signature's deadline
     */
    struct EIP712Signature {
        uint8 v;
        bytes32 r;
        bytes32 s;
        uint256 deadline;
    }

    /**
     * @notice Contains the curation BPS and staking BPSfor every Curation.
     *
	 * @param sellers The addresses of the sellers.
	 * @param sellerFundsRecipients The addresses where funds are sent after the trade.
	 * @param sellerBpses The fee that is sent to the sellers.
	 * @param curationBps The points fee of willing to share of the NFT income to curators.
	 * @param stakingBps The points fee of willing to share of the NFT income to delegators who staking tokens.
     */
    struct CurationData {
		address[] sellers;
        address[] sellerFundsRecipients;
		uint16[] sellerBpses;
		uint16 curationBps;
		uint16 stakingBps;
    }

    /**
     * @notice A struct containing the parameters required for the `createCuration()` function.
     *
     * @param tokenId The token id.
     * @param curationData The data of curation.
     */
    struct CreateCurationData {
        uint256 tokenId;
        CurationData curationData;
    }

    /**
     * @notice The metadata for a fix price market.
     *
     * @param currency The currency to ask.
     * @param price The fix price of nft.
     */
    struct FixPriceMarketData {
        address currency;
        uint256 price;
    }

    /**
     * @notice The metadata of a protocol fee setting
     * @param feeBps The basis points fee
     * @param treasury The recipient of the fee
     */
    struct ProtocolFeeSetting {
        uint16 feeBps;
        address treasury;
    }
}