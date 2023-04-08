module default {
    abstract type Timestamp {
        required property created -> datetime {
            readonly := true;
            default := datetime_current();
        }
        required property updated -> datetime {
            default := datetime_current();
        }
    }
    type Person extending Timestamp {
        required property firstname -> str;
        required property lastname -> str;
        property fullname := .firstname ++ ' ' ++ .lastname;
        property nickname -> str;
        required property status -> Status{
            default := Status.PENDING;
        }

        # linked fields
        multi link identity -> Identity;

        # indexes, constraints
        index on (.fullname);
    }

    type Identity extending Timestamp {
        property login -> str;
        required property email -> str;
        property password -> str;
        link provider -> Provider {
            default := (select Provider filter .name = "ardency" Limit 1);
        };
        multi link tokens := (.<identity[is Token]);
        required property preferred -> bool {
            default := false;
        }

        # Each combination of email and provider must be unique.
        constraint exclusive on ( (.email, .provider));

        index on (.email);
        index on (.login);
    }

    type Token extending Timestamp {
        required property access_token -> str;
        property expiry -> int64;
        property token_type -> str;
        property refresh_token -> str;
        property scope -> str;
        property tokenid -> str;
        required link identity -> Identity;
    }

    type Provider extending Timestamp {
        required property name -> str;
        property client -> str;
        property secret -> str;
        property grant_type -> str;
        property redirect_url -> str;
        property meta -> json;
        
        constraint exclusive on (.name);
        index on (.name);
    }

    scalar type Status extending enum<ACTIVE, PENDING, INACTIVE, BLOCKED>;

}
