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
 *      - Allows the creation of new proposals with a title, description, and a required vote count.
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
    uint256 counter; // Counter to track the proposal IDs

    /**
     * @dev Creates a new proposal.
     * @param _title Title of the proposal.
     * @param _description Description of the proposal.
     * @param _total_vote_to_end Total number of votes required to end the proposal.
     *
     * This function increments the counter and stores a new proposal
     * in the proposal history mapping with the given details.
     */
    function create(string calldata _title, string calldata _description, uint256 _total_vote_to_end) external {
        counter += 1;
        proposal_history[counter] = Proposal(_title, _description, 0, 0, 0, _total_vote_to_end, false, true);
    }
}
