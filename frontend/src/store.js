
// Ref
// https://svelte.dev/repl/a551a40e90374fd2861255c957123af2?version=3.22.2

import {writable} from 'svelte/store'

export const todos = writable([]);

export const fake_data = [
    {
        "_id": {
            "$oid": "60135d1688d215800e01a20d"
        },
        "title": "abc",
        "description": "abcd"
    },
    {
        "_id": {
            "$oid": "60135dad88d215800e01a20e"
        },
        "title": "abc2",
        "description": "abc2"
    },
    {
        "_id": {
            "$oid": "6013612e88d215800e01a20f"
        },
        "title": "bosta",
        "description": "again"
    },
    {
        "_id": {
            "$oid": "60136696cdad4267088cb2ec"
        },
        "title": "olha",
        "description": "que merda"
    },
    {
        "_id": {
            "$oid": "601366f9cdad4267088cb2ed"
        },
        "title": "oba ",
        "description": "oba agora vai"
    }
];
