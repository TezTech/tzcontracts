%version
0.53;
type storage = (map(address, tez), (string, (string, nat)));
contract type ContractType = {
  type storage;
  [%%entry:
    let main:
      (~parameter: (address, (tez, bytes)), storage) =>
      (list(operation), storage)
  ];
};
let l5: list(operation) = [];
let%entry main = (parameter: bytes, storage: storage) => {
  let res10 =
    switch (Bytes.sub(0p, 4p, parameter)) {
    | None => failwith(100p)
    | Some(var12) => var12
    };
  let by19: bytes = 0x19308cc0;
  let _ = compare(by19, res10);
  if (by19 == res10) {
    let sub27 = Bytes.size(parameter) - 4p;
    if (sub27 > 0) {
      ();
    } else {
      failwith(102p);
    };
    let res49 =
      switch (
        (
          Bytes.unpack(
            switch (
              Bytes.sub(
                4p,
                switch%nat (sub27) {
                | Plus(sub27) => sub27
                | Minus(sub27) => sub27
                },
                parameter,
              )
            ) {
            | None => failwith(101p)
            | Some(var41) => var41
            },
          ):
            option((address, (tez, option(bytes))))
        )
      ) {
      | None => failwith(103p)
      | Some(var51) => var51
      };
    let pair58 = (res49, (l5, storage));
    let _ = (None: option(tez), pair58);
    if (Map.mem(Current.sender(), storage[0p]) == true) {
      ();
    } else {
      failwith("Failed assert");
    };
    let res77 =
      switch (Map.find(Current.sender(), storage[0p])) {
      | None => failwith("Key not found in map")
      | Some(var79) => var79
      };
    let _ = (res77, pair58);
    let var57_snd87_fst88 = res49[1p][0p];
    let _ = compare(res77, var57_snd87_fst88);
    if (res77 >= var57_snd87_fst88) {
      ();
    } else {
      failwith("Failed assert");
    };
    let sub101 = res77 - res49[1p][0p];
    let _ = Some(sub101);
    let update104 = Map.add(Current.sender(), sub101, storage[0p]);
    let pair108 = (res49, (l5, (update104, storage[1p])));
    let _ = (res77, pair108);
    let mem113 = Map.mem(res49[0p], update104);
    let _ = compare(mem113, true);
    let res117 =
      if (mem113 == true) {
        (
          switch (Map.find(res49[0p], update104)) {
          | None => failwith("Key not found in map")
          | Some(var124) => var124
          },
          pair108,
        );
      } else {
        (0tz, pair108);
      };
    let add143 = res117[0p] + res117[1p][0p][1p][0p];
    let _ = Some(add143);
    let var134_snd150 = res117[1p];
    let var134_snd150_snd151 = var134_snd150[1p];
    let pair154 = (
      Map.add(res117[1p][0p][0p], add143, res117[1p][1p][1p][0p]),
      var134_snd150_snd151[1p][1p],
    );
    let var134_snd150_snd151_fst155 = var134_snd150_snd151[0p];
    let var134_snd150_fst157 = var134_snd150[0p];
    let var134_fst159 = res117[0p];
    let res163 =
      switch (var134_snd150_fst157[1p][1p]) {
      | None => false
      | Some(_) => true
      };
    let _ = compare(res163, true);
    (
      if (res163 == true) {
        let exp206 =
          Contract.call(
            ~dest=
              switch (
                (
                  Contract.at(var134_snd150_fst157[0p]):
                    option(ContractType.instance)
                )
              ) {
              | None => failwith("Invalid contract")
              | Some(var199) => var199
              },
            ~amount=0tz,
            ~parameter=(
              Current.sender(),
              (
                var134_snd150_fst157[1p][0p],
                switch (var134_snd150_fst157[1p][1p]) {
                | None => failwith("Optional value is empty")
                | Some(var182) => var182
                },
              ),
            ),
          );
        (
          var134_fst159,
          (
            var134_snd150_fst157,
            ([exp206, ...var134_snd150_snd151_fst155], pair154),
          ),
        );
      } else {
        (
          var134_fst159,
          (var134_snd150_fst157, (var134_snd150_snd151_fst155, pair154)),
        );
      }
    )[1p][1p];
  } else {
    failwith(400p);
  };
};
