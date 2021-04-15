pragma solidity 0.8.3;


contract Vote {
    uint public phantomVotes = 0; 
    uint public zackVotes = 0;

    event incrementVote(uint value);
    

    function vote(uint numberOfvoter) payable public returns(string memory) {
        if (numberOfvoter == 1) {
            phantomVotes += 1;
            emit incrementVote(phantomVotes);
            return 'Voted for Phantom!';
        } else if (numberOfvoter == 0) {
            zackVotes += 1;
            emit incrementVote(zackVotes);
            return 'Voted for Zack!';
        } else {
            return "Didn't vote for anyone. Or u dint vote";
        }
    }
}