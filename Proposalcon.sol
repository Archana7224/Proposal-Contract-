// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @title ProposalContract
 * @dev A simple voting system for proposals created by the owner.
 *      - Proposals have a title and description.
 *      - Tracks the number of approve, reject, and pass votes.
 *      - Specifies a vote limit to determine when a proposal ends.
 *      - Records the current state of a proposal (passed or failed).
 *      - Maintains a history of all proposals.
 *      - Ensures users cannot vote more than once.
 */
contract ProposalContract {

    struct Proposal {
        string title; // Title of the proposal
        string description; // Description of the proposal
        uint256 approve; // Number of approve votes
        uint256 reject; // Number of reject votes
        uint256 pass; // Number of pass votes
        uint256 total_vote_to_end; // When the total votes in the proposal reaches this limit, proposal ends
        bool current_state; // This shows the current state of the proposal, meaning whether if passes or fails
        bool is_active; // This shows if others can vote to our contract
    }

    mapping(uint256 => Proposal) proposal_history; // Recordings of previous proposals
}
