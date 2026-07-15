declare module '@apiverve/jsonschemagenerator' {
  export interface jsonschemageneratorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface jsonschemageneratorResponse {
    status: string;
    error: string | null;
    data: JSONSchemaGeneratorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface JSONSchemaGeneratorData {
      schema:     null | string;
      title:      null | string;
      type:       null | string;
      properties: Properties;
      required:   (null | string)[];
  }
  
  interface Properties {
      name:   Active;
      age:    Active;
      email:  Email;
      active: Active;
  }
  
  interface Active {
      type: null | string;
  }
  
  interface Email {
      type:   null | string;
      format: null | string;
  }

  export default class jsonschemageneratorWrapper {
    constructor(options: jsonschemageneratorOptions);

    execute(callback: (error: any, data: jsonschemageneratorResponse | null) => void): Promise<jsonschemageneratorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: jsonschemageneratorResponse | null) => void): Promise<jsonschemageneratorResponse>;
    execute(query?: Record<string, any>): Promise<jsonschemageneratorResponse>;
  }
}
