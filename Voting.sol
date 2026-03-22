// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public immutable OWNER;
    struct Msg {
        uint256 votes;
        bool exists;
    }

    mapping(address => Msg) public candidate;
    mapping(address => bool) public voteUser;
    address[] public allCandidate;

    //初始化OWNER
    constructor() {
        OWNER = msg.sender;
    }

    //添加权限控制
    modifier onlyOwner() {
        require(msg.sender == OWNER, "Not the owner");
        _;
    }

    //添加候选人名单
    function addCandidate(address[] memory list) public onlyOwner {
        require(list.length > 0, "The list cannot be empty");
        require(list.length < 10, "List limit exceeded");
        uint len = list.length;

        for (uint i = 0; i < len; i++) {
            candidate[list[i]] = Msg({
                votes: 0,
                exists: true
            });
        }

        allCandidate = list;
    }

    //投票
    function vote(address target) public {
        require(candidate[target].exists, "The target not the candidate"); //检查投票目标是否候选人
        require(!voteUser[msg.sender], "You have already voted");   //检查用户是否已投票

        voteUser[msg.sender] = true;
        candidate[target].votes++;
    }
    
    //返回候选人投票数
    function getVotes(address target) public view returns(uint) {
        uint votes = candidate[target].votes;
        return votes;
    }

    //重置所有候选人的得票数
    function resetVotes() public {
        uint len = allCandidate.length;
        for (uint i = 0; i < len; i++) {
            candidate[allCandidate[i]].votes = 0;
        }
    }

    //返回所有候选人
    function getCandidates() public view returns(address[] memory) {
        return allCandidate;
    }
}
